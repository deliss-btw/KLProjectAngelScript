

struct FESMPostProcessAnimInstanceData
{
    UPROPERTY()
    bool bAttachLocationSet = false;
    UPROPERTY()
    FVector AttachLocation;
    UPROPERTY()
    bool bIsLocalPlayer = false;


}

class UESMAction_PostProcessAnim : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    UCameraPostProcessAnimConfig AnimConfig;
    UPROPERTY()
    bool bLocalOnly = true;
    UPROPERTY()
    float32 Radius = 5000.0f;
    UPROPERTY()
    int EnableFactionRelation = 7;
    UPROPERTY()
    bool bUpdateAttachLocation = false;
    UPROPERTY()
    bool bUseCustomDuration = false;
    UPROPERTY()
    float32 CustomDuration = 10.0f;
    UPROPERTY()
    bool bAttachFx = false;
    UPROPERTY()
    FName AttachFxTagName;
    UPROPERTY()
    bool bAttachSocket = false;
    UPROPERTY()
    FName AttachSocketName;
    UPROPERTY()
    FVector AttachOffset;


    UFUNCTION()
    FESMInstanceDataInfo GetViewInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMPostProcessAnimInstanceData);
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        int local_2;
        if (this.bLocalOnly)
        {
            local_2 = 2;
        }
        else
        {
            local_2 = 3;
        }
        return EESMActionType(local_2);
    }
    UFUNCTION()
    int GetActionPriority_Implementation() const
    {
        return 1;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.bLocalOnly)
        {
            return;
        }
        if ((!((this.AnimConfig != nullptr))))
        {
            return;
        }
        float local_9 = float32(Time.ActionDuration.ToSeconds());
        if (this.bUseCustomDuration)
        {
            local_9 = this.CustomDuration;
        }
        if (this.bAttachSocket)
        {
            ::PostProcessUtils::PlayCameraPostProcessRadius(Context.GetEntity(), this.Radius, this.EnableFactionRelation, this.bUpdateAttachLocation, this.AnimConfig, local_9, this.AttachSocketName, this.AttachOffset);
            return;
        }
        ::PostProcessUtils::PlayCameraPostProcessRadius(Context.GetEntity(), this.Radius, this.EnableFactionRelation, this.bUpdateAttachLocation, this.AnimConfig, local_9, NAME_None, FVector::ZeroVector);
        return;
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_36 = 0;
        int local_44 = 0;
        if ((!((this.AnimConfig != nullptr))))
        {
            return;
        }
        FECSEntity local_14 = Context.GetEntity();
        FECSWorldPtr local_6 = Context.GetECSWorld();
        GetDefaulted local_10;
        if ((!((local_14 == local_10.opCall().GetPlayerPawnEntity()))))
        {
            return;
        }
        this.ModifyViewInstanceData(Context).bIsLocalPlayer = true;
        Get local_24;
        const FC_ControlledByPlayer& local_26 = local_24.opCall();
        if (local_26)
        {
            if (FECSEntity(local_26.GetPlayerEntity()))
            {
                FECSWorldPtr local_6_2 = Context.GetECSWorld();
                TWeakObjectPtr<UCameraPostProcessAnimConfig> local_46 = TWeakObjectPtr<UCameraPostProcessAnimConfig>(this.AnimConfig);
                if (!(local_44.IsValid()) == !(false))
                {
                    UMaterialInstanceDynamic local_56 = Material::CreateDynamicMaterialInstance(__GetWorldContext(), this.AnimConfig.PostProcessAnim.BlendMaterial, NAME_None, EMIDCreationFlags(0));
                    local_36.AddBlendable(local_56, 1.0f);
                    local_44 = local_56;
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ViewTick_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_28 = 0;
        const AActor local_58;
        if (this.AnimConfig == nullptr)
        {
            return;
        }
        FESMPostProcessAnimInstanceData& local_6 = this.ModifyViewInstanceData(Context);
        bool local_3 = !(local_6.bIsLocalPlayer);
        bool local_7 = !(false);
        if (local_3 == local_7)
        {
            return;
        }
        Get local_12;
        const FC_ControlledByPlayer& local_14 = local_12.opCall();
        if (local_14)
        {
            if (FECSEntity(local_14.GetPlayerEntity()))
            {
                TWeakObjectPtr<UMaterialInstanceDynamic> local_30;
                bool local_7_2 = local_28.EsmMaterialsMap.Find(TWeakObjectPtr<UCameraPostProcessAnimConfig>(this.AnimConfig), local_30) && local_30.IsValid();
                if (local_7_2)
                {
                    if (this.bUpdateAttachLocation)
                    {
                        local_7_2 = true;
                    }
                    else
                    {
                        local_7_2 = (!(local_6.bAttachLocationSet) == !(false));
                    }
                    if (local_7_2)
                    {
                        if (this.bAttachFx)
                        {
                            Get local_38;
                            const FC_ESMFXCollector& local_40 = local_38.opCall();
                            if (local_40)
                            {
                                FECSEntity local_44;
                                if (local_40.FXEntities.Find(this.AttachFxTagName, local_44) && local_44.IsValid())
                                {
                                    const AFXActor local_48 = ECSFX::GetFXActor(local_44);
                                    if (local_48 != nullptr)
                                    {
                                        local_6.AttachLocation = local_48.GetActorLocation();
                                        local_6.bAttachLocationSet = true;
                                    }
                                }
                            }
                        }
                        else
                        {
                            local_58 = Context.GetEntity().GetActor();
                            if (local_58 != nullptr)
                            {
                                local_6.AttachLocation = local_58.GetActorLocation();
                                if (this.bAttachSocket)
                                {
                                    FTransform local_136;
                                    if ((!((this.AttachSocketName == NAME_None))))
                                    {
                                        local_136 = local_58.GetSocketTransform(this.AttachSocketName, ERelativeTransformSpace(0));
                                    }
                                    else
                                    {
                                        local_136 = local_58.GetActorTransform();
                                    }
                                    local_6.AttachLocation = local_136.TransformPosition(this.AttachOffset);
                                }
                                bool local_3_3 = true;
                                local_6.bAttachLocationSet = local_3_3;
                            }
                        }
                    }
                    UMaterialInstanceDynamic local_142;
                    this.AnimConfig.PostProcessAnim.UpdateAnim(local_142, local_6.AttachLocation, Context.GetEntity(), Time.ActionTime.ToSeconds(), Time.ActionDuration.ToSeconds(), Time.WorldTime);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_30 = 0;
        int local_36 = 0;
        if (this.AnimConfig == nullptr)
        {
            return;
        }
        if (!(this.ModifyViewInstanceData(Context).bIsLocalPlayer) == !(false))
        {
            return;
        }
        Get local_12;
        const FC_ControlledByPlayer& local_14 = local_12.opCall();
        if (local_14)
        {
            if (FECSEntity(local_14.GetPlayerEntity()))
            {
                FECSWorldPtr local_24 = Context.GetECSWorld();
                TWeakObjectPtr<UMaterialInstanceDynamic> local_38;
                bool local_7 = local_36.EsmMaterialsMap.RemoveAndCopyValue(TWeakObjectPtr<UCameraPostProcessAnimConfig>(this.AnimConfig), local_38);
                if (local_7)
                {
                    UMaterialInstanceDynamic local_42;
                    local_30.RemoveBlendable(local_42);
                }
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
    void PreviewBegin_Implementation(const FESMPreviewContext &inout Context, const FESMActionTime &inout Time, const bool bNewlyBegin)
    {
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
    const FESMPostProcessAnimInstanceData GetViewInstanceData(const FESMViewContext &inout Context) const
    {
        const FESMPostProcessAnimInstanceData __r;
        return __r;
    }
    FESMPostProcessAnimInstanceData ModifyViewInstanceData(const FESMViewContext &inout Context) const
    {
        FESMPostProcessAnimInstanceData __r;
        return __r;
    }
}

