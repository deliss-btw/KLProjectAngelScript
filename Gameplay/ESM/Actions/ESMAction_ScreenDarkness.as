

struct FESMScreenDarknessInstanceData
{
    UPROPERTY()
    FECSEntity DarknessPlaneEntity;
    UPROPERTY()
    FECSMeshComponentProxy DarknessPlaneMesh;

    FESMScreenDarknessInstanceData()
    {
        return;
    }
}

class UESMAction_ScreenDarkness : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    TSubclassOf<AActor> ScreenDarknessPlaneOverride;
    UPROPERTY()
    FRuntimeFloatCurve DarknessCurve = FRuntimeCurveUtils::CreateAutoTangent(0.0f, 0.0f, 0.7f, 1.0f, 1.0f, 0.0f);

    UESMAction_ScreenDarkness()
    {
        return;
    }
    UFUNCTION()
    FESMInstanceDataInfo GetViewInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMScreenDarknessInstanceData);
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_30 = 0;
        UCombatGlobalSettings local_4 = ::UCombatGlobalSettings::Get();
        if (local_4 == nullptr || (local_4.ScreenDarknessPlane == nullptr))
        {
            return;
        }
        FECSEntity local_20 = FECSEntity(Context.GetEntity());
        FECSWorldPtr local_12 = Context.GetECSWorld();
        GetDefaulted local_16;
        if (!((local_20 == local_16.opCall().GetPlayerPawnEntity())))
        {
            return;
        }
        FESMScreenDarknessInstanceData& local_32 = this.ModifyViewInstanceData(Context);
        TSubclassOf<AActor> TSubclassOf<AActor>() = this.ScreenDarknessPlaneOverride.IsValid() ? this.ScreenDarknessPlaneOverride : local_4.ScreenDarknessPlane;
        local_32.DarknessPlaneEntity = FECSViewDataUtils::CreateLocalActorViewEntity(TSubclassOf<AActor>(), FTransform(FQuat::Identity, local_30.GetPosition(), FVector::OneVector));
        return;
    }
    UFUNCTION()
    void ViewTick_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_8 = 0;
        const FESMScreenDarknessInstanceData& local_2 = this.GetViewInstanceData(Context);
        FECSActorProxy local_12 = local_2.DarknessPlaneEntity.ModifyActor();
        if (local_12)
        {
            local_12.ModifyTransform().SetLocation(local_8.GetPosition());
            if (!(local_2.DarknessPlaneMesh.IsValid()))
            {
                FName local_24 = local_12.GetComponentNameByClass(UStaticMeshComponent);
                if (!(local_24.IsNone()))
                {
                    FESMScreenDarknessInstanceData& local_26 = this.ModifyViewInstanceData(Context);
                    local_2.DarknessPlaneEntity.ModifyActorComponent(local_24).CastToMeshComponent();
                }
            }
        }
        if (local_2.DarknessPlaneMesh.IsValid())
        {
            local_2.DarknessPlaneMesh.SetScalarParameterValueOnMaterials(n"Opacity", this.DarknessCurve.GetFloatValue(float32(Time.ActionTime.ToSeconds()), 0.0f));
        }
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FESMScreenDarknessInstanceData& local_2 = this.GetViewInstanceData(Context);
        if (local_2.DarknessPlaneEntity.IsValid())
        {
            FECSViewDataUtils::DestroyLocalActorViewEntity(local_2.DarknessPlaneEntity);
        }
        return;
    }
    const FESMScreenDarknessInstanceData GetViewInstanceData(const FESMViewContext &inout Context) const
    {
        const FESMScreenDarknessInstanceData __r;
        return __r;
    }
    FESMScreenDarknessInstanceData ModifyViewInstanceData(const FESMViewContext &inout Context) const
    {
        FESMScreenDarknessInstanceData __r;
        return __r;
    }
}

