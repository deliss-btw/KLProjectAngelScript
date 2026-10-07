

struct FESMControlTurretInstanceData
{
    UPROPERTY()
    FECSEntity TurretManipulated;

    FESMControlTurretInstanceData()
    {
        return;
    }
}

class UESMAction_ControlTurretTransform : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    bool bResetAimRotatorWhenExit = false;


    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMControlTurretInstanceData);
    }
    UFUNCTION()
    FESMInstanceDataInfo GetViewInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMControlTurretInstanceData);
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(3);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        bool local_1;
        int local_28 = 0;
        Has local_6;
        if (!(ECS::GetRuntimeInfo().IsServer) || !(local_6.opCall()))
        {
            return;
        }
        ::FC_AnimAimTargetControl::SetUseAnimAimTargetControl(Context.GetEntity(), true);
        const FECSEntity& local_10 = Context.GetEntity();
        FECSEntity local_14;
        Get local_18;
        const FC_InteractionInfoForESM& local_20 = local_18.opCall();
        if (local_20)
        {
            local_14 = local_20.GetTargetEntity();
        }
        if (local_14.IsValid())
        {
            this.ModifyInstanceData(Context).TurretManipulated = local_14;
            Get local_32;
            local_10.MoveTo(local_28.GetPosition().AddZ(local_32.opCall().GetScaledHalfHeight()), local_28.GetRotation(), FFPTime(-1));
            Get local_50;
            const FC_TurretAttachmentConfig& local_52 = local_50.opCall();
            if (local_52)
            {
                Has local_56;
                bool local_7 = local_56.opCall();
                if (local_7)
                {
                    Get local_60;
                    FECSEntity local_64 = local_60.opCall().GetPlayerEntity();
                    Get local_68;
                    FECSNetUtils::SetNetPredict(local_14, FNetPlayerMask::MakeForPlayerIndex(local_68.opCall().GetPlayerIndex()));
                }
                FECSWorldPtr local_74 = ECS::GetECSWorld();
                local_1 = false;
                local_52.AttachConfig.GetSocketName();
                ModifyOrAdd local_88;
                FC_Owner& local_90 = local_88.opCall();
                if (local_90)
                {
                    local_90.SetOwnerEntity(local_10);
                }
                FC_ScalerResourceTransferToOwner local_96;
                Assign local_94;
                local_94.opCall(local_96);
                Assign local_100;
                local_100.opCall(FC_CharacterAimVisualOverrideBlockedTag());
                ModifyOrAdd local_106;
                FC_PropManipulator& local_108 = local_106.opCall();
                if (local_108)
                {
                    local_108.SetManipulatedPropEntity(local_14);
                }
                ModifyOrAdd local_112;
                FC_PropManipulated& local_114 = local_112.opCall();
                if (local_114)
                {
                    local_114.SetManipulatorPawnEntity(Context.GetEntity());
                }
                ModifyOrAdd local_118;
                FC_TPCameraYawLimitRelativeTo& local_120 = local_118.opCall();
                if (local_120)
                {
                    Get local_26;
                    const FC_Transform& local_122 = local_26.opCall();
                    if (local_122)
                    {
                        local_120.SetYaw(float32(local_122.GetRotation().Rotator().Yaw));
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FECSEntity& local_2 = Context.GetEntity();
        FECSEntity local_6;
        Get local_10;
        const FC_InteractionInfoForESM& local_12 = local_10.opCall();
        if (local_12)
        {
            local_6 = local_12.GetTargetEntity();
        }
        if (local_6.IsValid())
        {
            this.ModifyViewInstanceData(Context).TurretManipulated = local_6;
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Has local_6;
        bool local_7;
        int local_16 = 0;
        if (!(ECS::GetRuntimeInfo().IsServer) || !(local_6.opCall()))
        {
            return;
        }
        ::FC_AnimAimTargetControl::SetUseAnimAimTargetControl(Context.GetEntity(), false);
        FECSWorldPtr local_10 = ECS::GetECSWorld();
        const FECSEntity& local_18 = Context.GetEntity();
        FECSEntity local_22;
        Get local_26;
        const FC_InteractionInfoForESM& local_28 = local_26.opCall();
        if (local_28)
        {
            local_22 = local_28.GetTargetEntity();
        }
        if (!(local_22.IsValid()))
        {
            local_7 = false;
        }
        else
        {
            local_7 = local_6.opCall();
        }
        if (local_7)
        {
            Remove local_66;
            Remove local_58;
            Remove local_54;
            Get local_32;
            const FC_TurretAttachmentConfig& local_34 = local_32.opCall();
            if (local_34)
            {
                Has local_38;
                local_7 = local_38.opCall();
                if (local_7)
                {
                    FECSNetUtils::SetNetPredict(local_22, FNetPlayerMask());
                }
                if (local_34.AttachConfig.GetbUseDetachOffset())
                {
                    ::FAttachmentUtils::EntityDetach(local_18, local_16.Time, local_34.AttachConfig.GetDetachLocationOffset(), local_34.AttachConfig.GetDetachRotationOffset(), false, uint8(0), false);
                }
                else
                {
                    ::FAttachmentUtils::EntityDetachWithoutOffset(local_18, local_16.Time, false, uint8(0));
                }
                Remove local_46;
                local_46.opCall();
                Remove local_50;
                local_50.opCall();
                local_54.opCall();
                local_58.opCall();
                Remove local_62;
                local_62.opCall();
                local_66.opCall();
            }
        }
        else
        {
            Remove local_66;
            Remove local_58;
            Remove local_54;
            ::FAttachmentUtils::EntityDetachWithoutOffset(local_18, local_16.Time, false, uint8(0));
            local_54.opCall();
            local_58.opCall();
            local_66.opCall();
        }
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        AGameMechanismActor local_14;
        const FESMControlTurretInstanceData& local_2 = this.GetViewInstanceData(Context);
        if ((!((local_2.TurretManipulated == ENTITY_NULL))))
        {
            local_14 = (Cast<AGameMechanismActor>(local_2.TurretManipulated.GetActor()));
            if (local_14 != nullptr)
            {
                AActor local_18 = Context.GetEntity().GetMutableActor();
                if (local_18 != nullptr)
                {
                    local_18.GetDefaultAttachComponent().SetRelativeRotation(FRotator(0.0, 0.0, 0.0));
                }
                if (this.bResetAimRotatorWhenExit)
                {
                    TArray<USceneComponent> local_38 = local_14.GetCachedSceneComponentByLogicName(FName("YawAxisMeshName"));
                    if (local_38.Num() > 0)
                    {
                        for (auto local_58 : local_38)
                        {
                            local_58.SetRelativeRotation(FRotator::ZeroRotator);
                        }
                    }
                    TArray<USceneComponent> local_42 = local_14.GetCachedSceneComponentByLogicName(FName("PitchAxisMeshName"));
                    if (local_42.Num() > 0)
                    {
                        for (auto local_58 : local_42)
                        {
                            local_58.SetRelativeRotation(FRotator::ZeroRotator);
                        }
                    }
                }
            }
        }
        return;
    }
    FESMControlTurretInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FESMControlTurretInstanceData __r;
        return __r;
    }
    FESMControlTurretInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FESMControlTurretInstanceData __r;
        return __r;
    }
    const FESMControlTurretInstanceData GetViewInstanceData(const FESMViewContext &inout Context) const
    {
        const FESMControlTurretInstanceData __r;
        return __r;
    }
    FESMControlTurretInstanceData ModifyViewInstanceData(const FESMViewContext &inout Context) const
    {
        FESMControlTurretInstanceData __r;
        return __r;
    }
}

