
enum EPresentationCameraLookAtRotationType
{
    TargetEntityRotation,
    TargetToSourceRotation,
}


UCLASS(Abstract)
class UInteractionStateActionBase : UObject
{
    UInteractionStateActionBase()
    {
        return;
    }
    void OnActionBegin(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        return;
    }
    void OnActionEnd(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        return;
    }
}

UCLASS(Abstract)
class UInteractionStatePresentationActionBase : UObject
{
    UInteractionStatePresentationActionBase()
    {
        return;
    }
    void OnActionBeginPresentation(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        return;
    }
    void OnActionEndPresentation(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        return;
    }
}

class UInteractionStateAction_CameraOverride : UInteractionStateActionBase
{
    UPROPERTY()
    bool bOverrideLookAtTarget;
    UPROPERTY()
    bool bLookAtInteractPoint = true;
    UPROPERTY()
    FVector LookAtTargetOffset;
    UPROPERTY()
    FName LookAtTargetSocketName;
    UPROPERTY()
    FDataObjectPtr LookAtConfig;
    UPROPERTY()
    FDataObjectPtr OverrideCameraState;


    void OnActionBegin(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        int local_112 = 0;
        if (InteractSource.IsValid() && InteractTarget.IsValid())
        {
            FCameraOverrideParam local_90;
            if (this.bOverrideLookAtTarget)
            {
                local_90.SetLookAtTargetEntity(InteractTarget);
                if (this.bLookAtInteractPoint)
                {
                    FVector local_96;
                    FQuat local_104;
                    FECSWorldPtr local_106 = InteractSource.GetWorld();
                    FFPTime local_116 = FTransformUtils::GetPlayerRollbackTime(InteractSource, local_112);
                    ::FInteractUtils::GetInteractTargetLocationAndRotation(InteractTarget, InteractTargetPointAndBehaviorIndex.GetPointIndex(), local_116, local_96, local_104, false);
                    Get local_128;
                    local_90.SetLookAtTargetOffset((local_96 - FVector(local_128.opCall().GetPosition())));
                    local_90.SetLookAtTargetSocketName(NAME_None);
                }
                else
                {
                    local_90.SetLookAtTargetOffset(this.LookAtTargetOffset);
                    local_90.SetLookAtTargetSocketName(this.LookAtTargetSocketName);
                }
                local_90.SetLookAtConfig(this.LookAtConfig);
            }
            local_90.SetLayer(ECameraOverrideLayer(2));
            local_90.SetCameraState(this.OverrideCameraState);
            ::FCameraOverrideUtils::AddSyncCameraOverrideLayer(InteractSource, local_90);
        }
        return;
    }
    void OnActionEnd(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        if (InteractSource.IsValid())
        {
            ::FCameraOverrideUtils::RemoveSyncCameraOverrideLayer(InteractSource, ECameraOverrideLayer(2));
        }
        return;
    }
}

class UInteractionStateAction_TargetAbilityEvent : UInteractionStateActionBase
{
    UPROPERTY()
    bool bSendBeginEvent;
    UPROPERTY()
    bool bSendEndEvent;
    UPROPERTY()
    FName BeginEventName;
    UPROPERTY()
    FName EndEventName;

    UInteractionStateAction_TargetAbilityEvent()
    {
        super();
        return;
    }
    void OnActionBegin(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        if (!(this.BeginEventName.IsNone()) && InteractSource.IsValid() && InteractTarget.IsValid())
        {
            ::FInteractUtils::CreateInteractActionTargetAbilityEvent(InteractSource, InteractTarget, this.BeginEventName, InteractTargetPointAndBehaviorIndex);
        }
        return;
    }
    void OnActionEnd(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        if (!(this.EndEventName.IsNone()) && InteractSource.IsValid() && InteractTarget.IsValid())
        {
            ::FInteractUtils::CreateInteractActionTargetAbilityEvent(InteractSource, InteractTarget, this.EndEventName, InteractTargetPointAndBehaviorIndex);
        }
        return;
    }
}

class UInteractionStatePresentationAction_UIPange : UInteractionStatePresentationActionBase
{
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> PageWidget;
    UPROPERTY()
    FGameplayTag WidgetTag;

    UInteractionStatePresentationAction_UIPange()
    {
        super();
        return;
    }
    void OnActionBeginPresentation(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        bool local_1;
        if (!(this.WidgetTag.IsValid() || !(this.PageWidget.IsNull())))
        {
            local_1 = false;
        }
        else
        {
            Has local_6;
            local_1 = local_6.opCall();
        }
        if (local_1)
        {
            ::FInteractUIPageUtils::OpenPageByInteractTarget(InteractTarget, InteractTargetPointAndBehaviorIndex, this.WidgetTag, this.PageWidget);
        }
        return;
    }
    void OnActionEndPresentation(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        bool local_1;
        if (!(this.WidgetTag.IsValid() || !(this.PageWidget.IsNull())))
        {
            local_1 = false;
        }
        else
        {
            Has local_6;
            local_1 = local_6.opCall();
        }
        if (local_1)
        {
            ::FInteractUIPageUtils::ClosePageByInteractTarget(InteractTarget);
        }
        return;
    }
}

class UInteractionStateAction_AddSkill : UInteractionStateActionBase
{
    UPROPERTY()
    USkillConfig SkillConfig;
    UPROPERTY()
    ESkillSlot SkillSlot = ESkillSlot(8);


    void OnActionBegin(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        if (ECS::GetRuntimeInfo().IsServer && ((this.SkillConfig != nullptr)) && InteractSource.IsValid())
        {
            FSkillUtils::CreateSkillEntityAndAddSkill(InteractSource.GetWorld(), InteractSource, this.SkillConfig, this.SkillSlot, true, false, 1);
        }
        return;
    }
    void OnActionEnd(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        if (ECS::GetRuntimeInfo().IsServer && ((this.SkillConfig != nullptr)) && InteractSource.IsValid())
        {
            FECSEntity local_10 = FSkillUtils::GetSkillEntityByConfig(InteractSource, this.SkillConfig);
            if (local_10.IsValid())
            {
                FSkillUtils::RemoveSkill(InteractSource, local_10, true);
            }
        }
        return;
    }
}

class UInteractionStatePresentationAction_AnimatedCamera : UInteractionStatePresentationActionBase
{
    UPROPERTY()
    FName CameraName;
    UPROPERTY()
    EPresentationCameraLayer PresentationLayer = EPresentationCameraLayer(3);
    UPROPERTY()
    FAnimatedCameraParamsInput AnimatedCameraParamsInput;


    void OnActionBeginPresentation(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        FName local_2 = this.CameraName;
        if (!((local_2 != NAME_None)) && this.AnimatedCameraParamsInput.CameraConfig)
        {
            local_2 = this.AnimatedCameraParamsInput.CameraConfig.GetDataName();
        }
        ::PresentationCameraUtils::PushPresentationAnimatedCamera(InteractSource, local_2, this.PresentationLayer, this.AnimatedCameraParamsInput.CameraConfig, this.AnimatedCameraParamsInput);
        return;
    }
    void OnActionEndPresentation(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        FName local_2 = this.CameraName;
        if (!((local_2 != NAME_None)) && this.AnimatedCameraParamsInput.CameraConfig)
        {
            local_2 = this.AnimatedCameraParamsInput.CameraConfig.GetDataName();
        }
        ::PresentationCameraUtils::PopPresentationCamera(InteractSource, local_2, false);
        return;
    }
}

class UInteractionStatePresentationAction_TPCameraState : UInteractionStatePresentationActionBase
{
    UPROPERTY()
    FName CameraName;
    UPROPERTY()
    EPresentationCameraLayer PresentationLayer = EPresentationCameraLayer(3);
    UPROPERTY()
    TDataObjectPtr<FTPCameraStateConfig> CameraConfig;


    void OnActionBeginPresentation(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        FName local_2 = this.CameraName;
        if (!((local_2 != NAME_None)) && this.CameraConfig)
        {
            local_2 = this.CameraConfig.GetDataName();
        }
        ::PresentationCameraUtils::PushPresentationSpringArmCamera(InteractSource, local_2, this.PresentationLayer, this.CameraConfig);
        return;
    }
    void OnActionEndPresentation(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        FName local_2 = this.CameraName;
        if (!((local_2 != NAME_None)) && this.CameraConfig)
        {
            local_2 = this.CameraConfig.GetDataName();
        }
        ::PresentationCameraUtils::PopPresentationCamera(InteractSource, local_2, false);
        return;
    }
}

class UInteractionStatePresentationAction_LocalRegESMTransit : UInteractionStatePresentationActionBase
{
    UPROPERTY()
    FName BeginSMName;
    UPROPERTY()
    FName BeginStateName;
    UPROPERTY()
    FName EndSMName;
    UPROPERTY()
    FName EndStateName;

    UInteractionStatePresentationAction_LocalRegESMTransit()
    {
        super();
        return;
    }
    void OnActionBeginPresentation(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            this.TransitLocalRegESM(InteractTarget, this.BeginSMName, this.BeginStateName);
        }
        return;
    }
    void OnActionEndPresentation(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            this.TransitLocalRegESM(InteractTarget, this.EndSMName, this.EndStateName);
        }
        return;
    }
    void TransitLocalRegESM(const FECSEntity &inout InteractTarget, const FName &inout SMName, const FName &inout StateName)
    {
        int local_22 = 0;
        if (SMName.IsNone() || StateName.IsNone())
        {
            return;
        }
        Get local_6;
        const FC_DefaultToLocal& local_8 = local_6.opCall();
        if (local_8)
        {
            if (FECSEntity(local_8.LocalEntityId).IsValid())
            {
                local_22.SMName = SMName;
                local_22.StateName = StateName;
            }
        }
        return;
    }
}

class UInteractionStatePresentationAction_CameraLookAt : UInteractionStatePresentationActionBase
{
    UPROPERTY()
    FNameHandle_EntityBBVarEntity LookAtTargetEntityBBVar;
    UPROPERTY()
    FVector LookAtTargetOffset;
    UPROPERTY()
    FName LookAtTargetSocketName;
    UPROPERTY()
    TDataObjectPtr<FCameraLookAtTargetConfig> LookAtConfig;
    UPROPERTY()
    EPresentationCameraLookAtRotationType RotationType = EPresentationCameraLookAtRotationType(0);
    UPROPERTY()
    bool bCustomLookAtRotationMutePitch = false;
    UPROPERTY()
    bool bContributeToInput = true;


    void OnActionBeginPresentation(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        Get local_40;
        FNameHandle_EntityBBVarEntity local_8;
        local_8;
        FECSEntity local_12 = InteractSource.GetBB_Entity(local_8);
        if (local_12.IsValid())
        {
            int local_14;
            bool local_13 = false;
            local_14 = local_13;
            FVector local_20(FVector::ZeroVector);
            if (int(this.RotationType) == 1)
            {
                Get local_28;
                const FC_InteractionInfoForESM& local_30 = local_28.opCall();
                if (local_30)
                {
                    if (local_30.GetTargetEntity().IsValid())
                    {
                        FRotator local_64 = (FVector(local_40.opCall().GetPosition()) - FVector(local_40.opCall().GetPosition())).Rotation();
                        if (this.bCustomLookAtRotationMutePitch)
                        {
                            local_64.Pitch = 0.0;
                            local_64.Roll = 0.0;
                        }
                        local_20 = local_64.Vector();
                        local_13 = true;
                        local_14 = local_13;
                    }
                }
            }
            ::FPresentationCameraModificationUtils::ApplyPresentationCameraLookAtTarget(InteractSource, local_12, this.LookAtTargetOffset, this.LookAtTargetSocketName, this.bContributeToInput, this.LookAtConfig, (local_14 != 0), local_20);
        }
        else
        {
            XLog(ELog(0), FString().Append("LookAtTargetEntity is invalid, failed to apply look at target"));
        }
        return;
    }
    void OnActionEndPresentation(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        ::FPresentationCameraModificationUtils::ClearPresentationCameraLookAt(InteractSource);
        return;
    }
}

