

struct FESMControlTargetInstanceData
{
    UPROPERTY()
    FECSEntity ControlTarget;

    FESMControlTargetInstanceData()
    {
        return;
    }
}

class UESMAction_ControlFactureTransform : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    bool MoveToSocket = true;
    UPROPERTY()
    bool ControlPosition = false;
    UPROPERTY()
    bool ControlRotation = true;


    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMControlTargetInstanceData);
    }
    UFUNCTION()
    FESMInstanceDataInfo GetViewInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMControlTargetInstanceData);
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
        int local_32 = 0;
        int local_62 = 0;
        if (!(ECS::GetRuntimeInfo().IsServer))
        {
            return;
        }
        const FECSEntity& local_4 = Context.GetEntity();
        FECSEntity local_8;
        Get local_12;
        const FC_InteractionInfoForESM& local_14 = local_12.opCall();
        if (local_14)
        {
            local_8 = local_14.GetTargetEntity();
        }
        if (!(local_8.IsValid()))
        {
            local_1 = false;
        }
        else
        {
            Has local_18;
            local_1 = local_18.opCall();
        }
        if (local_1)
        {
            Has local_24;
            if (local_24.opCall())
            {
                return;
            }
            this.ModifyInstanceData(Context).ControlTarget = local_8;
            if (this.MoveToSocket)
            {
                Get local_36;
                local_4.MoveTo(local_32.GetPosition().AddZ(local_36.opCall().GetScaledHalfHeight()), local_32.GetRotation(), FFPTime(-1));
                ::FPossessUtils::PossessPropEntity(local_4, local_8);
            }
            Modify local_54;
            FC_ManipulateProp& local_56 = local_54.opCall();
            if (local_56)
            {
                local_56.SetManipulatorEntity(local_4);
                local_62.SetManipulatedPropEntity(local_8);
                local_62.SetFireResourceType(EProjectileFireResourceType(local_56.GetFireResourceType()));
                if ((int(local_62.GetFireResourceType())) == 0)
                {
                    local_62.SetEnergy(local_56.GetEnergy());
                    local_62.SetEnergyMax(local_56.GetEnergyMax());
                }
                else
                {
                    if ((int(local_62.GetFireResourceType())) == 1)
                    {
                        local_62.SetHeatValue(local_56.GetHeatValue());
                        local_62.SetHeatValueMax(local_56.GetHeatValueMax());
                        local_62.SetbIsOverHeat(local_56.GetbIsOverHeat());
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FESMControlTargetInstanceData& local_4;
        if (!(ECS::GetRuntimeInfo().IsServer))
        {
            return;
        }
        if ((!((local_4.ControlTarget == ENTITY_NULL))))
        {
            Has local_12;
            bool local_1 = local_12.opCall();
            if (local_1)
            {
                return;
            }
            Get local_16;
            const FC_DefaultAttachComponentMeshSpaceTransform& local_18 = local_16.opCall();
            if (local_18)
            {
                Get local_22;
                const FC_PossessPropConfig& local_24 = local_22.opCall();
                if (local_24)
                {
                    Modify local_28;
                    FC_TransformAttachmentLogic& local_30 = local_28.opCall();
                    if (local_30)
                    {
                        FRotator local_36;
                        Get local_40;
                        const FC_AnimAimTargetControl& local_42 = local_40.opCall();
                        if (local_42)
                        {
                            local_36 = local_42.GetAimTarget().Rotation();
                        }
                        local_36 = FRotator(0.0, local_36.Yaw, 0.0);
                        local_30.SetLocationOffset((local_18.Transform.GetLocation() + local_36.RotateVector(local_24.AttachConfig.GetLocationOffset())));
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
            Has local_18;
            bool local_13 = local_18.opCall();
            if (local_13)
            {
                return;
            }
            this.ModifyViewInstanceData(Context).ControlTarget = local_6;
        }
        return;
    }
    UFUNCTION()
    void ViewTick_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        AGameMechanismActor local_20;
        int local_38 = 0;
        const FESMControlTargetInstanceData& local_2 = this.GetViewInstanceData(Context);
        if ((!((local_2.ControlTarget == ENTITY_NULL))))
        {
            Has local_12;
            bool local_7 = local_12.opCall();
            if (local_7)
            {
                return;
            }
            AActor local_16 = local_2.ControlTarget.GetMutableActor();
            if (local_16 != nullptr)
            {
                local_20 = (Cast<AGameMechanismActor>(local_16));
                if (local_20 != nullptr)
                {
                    FRotator local_26 = FRotator(local_20.GetActorRotation());
                    FRotator local_44;
                    Has local_48;
                    bool local_7_2 = local_48.opCall();
                    if (local_7_2)
                    {
                        FECSWorldPtr local_50 = ECS::GetECSWorld();
                        Get local_54;
                        local_44 = local_54.opCall().ViewDir;
                    }
                    else
                    {
                        local_44 = local_38.GetAimTarget().Rotation();
                    }
                    local_20.AimRotator = (local_44 - local_26);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_16 = 0;
        if (!(ECS::GetRuntimeInfo().IsServer))
        {
            return;
        }
        Has local_8;
        bool local_1 = local_8.opCall();
        if (local_1)
        {
            return;
        }
        const FECSEntity& local_10 = Context.GetEntity();
        if (this.MoveToSocket)
        {
            ::FPossessUtils::UnPossessPropEntity(local_10);
        }
        if (local_16)
        {
            local_16.SetManipulatedPropEntity(ENTITY_NULL);
        }
        Modify local_14;
        FC_ManipulateProp& local_18 = local_14.opCall();
        if (local_18)
        {
            local_18.SetManipulatorEntity(ENTITY_NULL);
            if (local_16)
            {
                if ((int(local_16.GetFireResourceType())) == 0)
                {
                    local_18.SetEnergy(local_16.GetEnergy());
                    local_18.SetEnergyMax(local_16.GetEnergyMax());
                }
                else
                {
                    if ((int(local_16.GetFireResourceType())) == 1)
                    {
                        local_18.SetHeatValue(local_16.GetHeatValue());
                        local_18.SetHeatValueMax(local_16.GetHeatValueMax());
                    }
                }
            }
        }
        Remove local_26;
        local_26.opCall();
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        AGameMechanismActor local_18;
        const FESMControlTargetInstanceData& local_2 = this.GetViewInstanceData(Context);
        if ((!((local_2.ControlTarget == ENTITY_NULL))))
        {
            Has local_12;
            bool local_7 = local_12.opCall();
            if (local_7)
            {
                return;
            }
            local_18 = (Cast<AGameMechanismActor>(local_2.ControlTarget.GetMutableActor()));
            if (local_18 != nullptr)
            {
                AActor local_22 = Context.GetEntity().GetMutableActor();
                if (local_22 != nullptr)
                {
                    FRotator local_28;
                    local_22.GetDefaultAttachComponent().SetRelativeRotation(FRotator(0.0, 0.0, 0.0));
                }
                local_18.AimRotator = FRotator(0.0, 0.0, 0.0);
            }
        }
        return;
    }
    FESMControlTargetInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FESMControlTargetInstanceData __r;
        return __r;
    }
    FESMControlTargetInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FESMControlTargetInstanceData __r;
        return __r;
    }
    const FESMControlTargetInstanceData GetViewInstanceData(const FESMViewContext &inout Context) const
    {
        const FESMControlTargetInstanceData __r;
        return __r;
    }
    FESMControlTargetInstanceData ModifyViewInstanceData(const FESMViewContext &inout Context) const
    {
        FESMControlTargetInstanceData __r;
        return __r;
    }
}

