
namespace FFXUtils
{
    const FConsoleVariable CVar_Fx_LoadDebug = FConsoleVariable();

FECSEntity PlayFXDurational(const FECSEntity &inout OwnerEntity, const TSubclassOf<AFXActor> &inout FX, const TArray<FFXOverrideParam> &inout OverrideParam, const FName &inout AttachSocket, const bool IsAttached = false, const EFXBaseTransformResolveModeWithAttachmentOption BaseTransformResolveMode = EFXBaseTransformResolveModeWithAttachmentOption::AccordingToAttachmentSetting, const FVector &inout LocationOrOffset = FVector(0,0,0), const EFXOffsetSpaceWithAttachmentOption LocationOffsetSpace = EFXOffsetSpaceWithAttachmentOption::AccordingToAttachmentSetting, const FRotator &inout RotationOrOffset = FRotator(0,0,0), const EFXOffsetSpaceWithAttachmentOption RotationOffsetSpace = EFXOffsetSpaceWithAttachmentOption::AccordingToAttachmentSetting, const bool bLocalOnly = false, const FECSEntity &inout AttachOveride = FECSEntity(), const EAttachFXStopMethod AttachFXStopMethod = EAttachFXStopMethod::StopOnEntityDestroy)
{
    FFXConfig local_116;
    local_116.SetAsset(System::GetSoftClassPath(FX));
    bool local_127 = !(IsAttached);
    local_116.SetbDetach(local_127);
    FAttachRefName local_129 = local_116.GetAttachRefName();
    local_129.Name = AttachSocket;
    local_116.SetAttachRefName(local_129);
    local_116.SetLocationOffset(LocationOrOffset);
    local_116.SetRotationOffset(RotationOrOffset);
    local_116.SetOverrideParams(OverrideParam);
    if (int(BaseTransformResolveMode) == 0)
    {
        local_116.SetbUseWorldOriginAsBaseTransformSource(!(IsAttached));
    }
    else
    {
        if (int(BaseTransformResolveMode) == 1)
        {
            local_116.SetbUseWorldOriginAsBaseTransformSource(true);
        }
        else
        {
            if (int(BaseTransformResolveMode) == 2)
            {
                local_116.SetbUseWorldOriginAsBaseTransformSource(false);
            }
        }
    }
    if (int(LocationOffsetSpace) == 3)
    {
        int local_132;
        if (!(IsAttached))
        {
            local_132 = 2;
        }
        else
        {
            local_132 = 0;
        }
        local_116.SetLocationOffsetSpace(EFXOffsetSpace(local_132));
    }
    else
    {
        int local_133;
        local_133 = int(FFXUtils::ToEFXOffsetSpace(EFXOffsetSpaceWithAttachmentOption(LocationOffsetSpace)));
        local_116.SetLocationOffsetSpace(EFXOffsetSpace(local_133));
    }
    if (int(RotationOffsetSpace) == 3)
    {
        int local_133;
        if (!(IsAttached))
        {
            local_133 = 2;
        }
        else
        {
            local_133 = 0;
        }
        local_116.SetRotationOffsetSpace(EFXOffsetSpace(local_133));
    }
    else
    {
        int local_132;
        local_132 = int(FFXUtils::ToEFXOffsetSpace(EFXOffsetSpaceWithAttachmentOption(RotationOffsetSpace)));
        local_116.SetRotationOffsetSpace(EFXOffsetSpace(local_132));
    }
    FFPTime local_138 = ECS::GetContextTime();
    bool local_127_3 = !(bLocalOnly);
    return ECSFX::PlayFXDurationalEx(OwnerEntity, local_116, local_138, 1.0f, local_127_3, AttachOveride, EAttachFXStopMethod(AttachFXStopMethod), false);
}
FECSEntity PlayFXDurationalBySoftRef(const FECSEntity &inout OwnerEntity, const TSoftClassPtr<AFXActor> &inout FX, const TArray<FFXOverrideParam> &inout OverrideParam, const FName &inout AttachSocket, const bool IsAttached = false, const EFXBaseTransformResolveModeWithAttachmentOption BaseTransformResolveMode = EFXBaseTransformResolveModeWithAttachmentOption::AccordingToAttachmentSetting, const FVector &inout LocationOrOffset = FVector(0,0,0), const EFXOffsetSpaceWithAttachmentOption LocationOffsetSpace = EFXOffsetSpaceWithAttachmentOption::AccordingToAttachmentSetting, const FRotator &inout RotationOrOffset = FRotator(0,0,0), const EFXOffsetSpaceWithAttachmentOption RotationOffsetSpace = EFXOffsetSpaceWithAttachmentOption::AccordingToAttachmentSetting, const bool bLocalOnly = false, const FECSEntity &inout AttachOveride = FECSEntity(), const EAttachFXStopMethod AttachFXStopMethod = EAttachFXStopMethod::StopOnEntityDestroy)
{
    FFXConfig local_116;
    local_116.SetAsset(FSoftClassPath(FX.ToString()));
    bool local_129 = !(IsAttached);
    local_116.SetbDetach(local_129);
    FAttachRefName local_131 = local_116.GetAttachRefName();
    local_131.Name = AttachSocket;
    local_116.SetAttachRefName(local_131);
    local_116.SetLocationOffset(LocationOrOffset);
    local_116.SetRotationOffset(RotationOrOffset);
    local_116.SetOverrideParams(OverrideParam);
    if (int(BaseTransformResolveMode) == 0)
    {
        local_116.SetbUseWorldOriginAsBaseTransformSource(!(IsAttached));
    }
    else
    {
        if (int(BaseTransformResolveMode) == 1)
        {
            local_116.SetbUseWorldOriginAsBaseTransformSource(true);
        }
        else
        {
            if (int(BaseTransformResolveMode) == 2)
            {
                local_116.SetbUseWorldOriginAsBaseTransformSource(false);
            }
        }
    }
    if (int(LocationOffsetSpace) == 3)
    {
        int local_134;
        if (!(IsAttached))
        {
            local_134 = 2;
        }
        else
        {
            local_134 = 0;
        }
        local_116.SetLocationOffsetSpace(EFXOffsetSpace(local_134));
    }
    else
    {
        int local_135;
        local_135 = int(FFXUtils::ToEFXOffsetSpace(EFXOffsetSpaceWithAttachmentOption(LocationOffsetSpace)));
        local_116.SetLocationOffsetSpace(EFXOffsetSpace(local_135));
    }
    if (int(RotationOffsetSpace) == 3)
    {
        int local_135;
        if (!(IsAttached))
        {
            local_135 = 2;
        }
        else
        {
            local_135 = 0;
        }
        local_116.SetRotationOffsetSpace(EFXOffsetSpace(local_135));
    }
    else
    {
        int local_134;
        local_134 = int(FFXUtils::ToEFXOffsetSpace(EFXOffsetSpaceWithAttachmentOption(RotationOffsetSpace)));
        local_116.SetRotationOffsetSpace(EFXOffsetSpace(local_134));
    }
    FFPTime local_140 = ECS::GetContextTime();
    bool local_129_3 = !(bLocalOnly);
    return ECSFX::PlayFXDurationalEx(OwnerEntity, local_116, local_140, 1.0f, local_129_3, AttachOveride, EAttachFXStopMethod(AttachFXStopMethod), false);
}
FECSEntity PlayFXInstant(const FECSEntity &inout OwnerEntity, const TSubclassOf<AFXActor> &inout FX, const TArray<FFXOverrideParam> &inout OverrideParam, const FName &inout AttachSocket, const bool IsAttached = false, const EFXBaseTransformResolveModeWithAttachmentOption BaseTransformResolveMode = EFXBaseTransformResolveModeWithAttachmentOption::AccordingToAttachmentSetting, const FVector &inout LocationOrOffset = FVector(0,0,0), const EFXOffsetSpaceWithAttachmentOption LocationOffsetSpace = EFXOffsetSpaceWithAttachmentOption::AccordingToAttachmentSetting, const FRotator &inout RotationOrOffset = FRotator(0,0,0), const EFXOffsetSpaceWithAttachmentOption RotationOffsetSpace = EFXOffsetSpaceWithAttachmentOption::AccordingToAttachmentSetting, const bool bLocalOnly = false, const FECSEntity &inout AttachOveride = FECSEntity())
{
    FFXConfig local_116;
    local_116.SetAsset(System::GetSoftClassPath(FX));
    bool local_127 = !(IsAttached);
    local_116.SetbDetach(local_127);
    FAttachRefName local_129 = local_116.GetAttachRefName();
    local_129.Name = AttachSocket;
    local_116.SetAttachRefName(local_129);
    local_116.SetLocationOffset(LocationOrOffset);
    local_116.SetRotationOffset(RotationOrOffset);
    local_116.SetOverrideParams(OverrideParam);
    if (int(BaseTransformResolveMode) == 0)
    {
        local_116.SetbUseWorldOriginAsBaseTransformSource(!(IsAttached));
    }
    else
    {
        if (int(BaseTransformResolveMode) == 1)
        {
            local_116.SetbUseWorldOriginAsBaseTransformSource(true);
        }
        else
        {
            if (int(BaseTransformResolveMode) == 2)
            {
                local_116.SetbUseWorldOriginAsBaseTransformSource(false);
            }
        }
    }
    if (int(LocationOffsetSpace) == 3)
    {
        int local_132;
        if (!(IsAttached))
        {
            local_132 = 2;
        }
        else
        {
            local_132 = 0;
        }
        local_116.SetLocationOffsetSpace(EFXOffsetSpace(local_132));
    }
    else
    {
        int local_133;
        local_133 = int(FFXUtils::ToEFXOffsetSpace(EFXOffsetSpaceWithAttachmentOption(LocationOffsetSpace)));
        local_116.SetLocationOffsetSpace(EFXOffsetSpace(local_133));
    }
    if (int(RotationOffsetSpace) == 3)
    {
        int local_133;
        if (!(IsAttached))
        {
            local_133 = 2;
        }
        else
        {
            local_133 = 0;
        }
        local_116.SetRotationOffsetSpace(EFXOffsetSpace(local_133));
    }
    else
    {
        int local_132;
        local_132 = int(FFXUtils::ToEFXOffsetSpace(EFXOffsetSpaceWithAttachmentOption(RotationOffsetSpace)));
        local_116.SetRotationOffsetSpace(EFXOffsetSpace(local_132));
    }
    FFPTime local_138 = ECS::GetContextTime();
    bool local_127_3 = !(bLocalOnly);
    return ECSFX::PlayFXInstantEx(OwnerEntity, local_116, local_138, 1.0f, local_127_3, false, AttachOveride);
}
void StopFX(const FECSEntity &inout FXEntity, const bool bDestroyImmediately = false)
{
    ECSFX::StopFX(FXEntity, bDestroyImmediately, false, 0.0f);
    return;
}
UFUNCTION()
void SetNiagaraComponentDitherOverrideParam(const FECSEntity &inout Entity, const FC_VisualComponentToggleConfig &inout VisualComponentToggleConfig, const FFPTime &inout CurrentTime, const TArray<FName> &inout LogicNames)
{
    UNiagaraComponent local_50;
    AGameActor local_6 = (Cast<AGameActor>(Entity.GetActor()));
    if (local_6 == nullptr)
    {
        return;
    }
    for (auto& local_22 : LogicNames)
    {
        int local_24 = VisualComponentToggleConfig.Names.IndexOfByKey(local_22);
        if (local_24 >= 0 && (local_24 < VisualComponentToggleConfig.FXParamOverrideSettings.Num()))
        {
            for (auto local_46 : local_6.GetCachedSceneComponentByLogicName(local_22))
            {
                local_50 = Cast<UNiagaraComponent>(local_46);
                if (local_50 != nullptr)
                {
                    int local_28;
                    local_50.Deactivate();
                    for (auto& local_64 : local_28)
                    {
                        if (int(local_64.Trigger) == 1)
                        {
                            if (local_64.bOverrideFloatCurve)
                            {
                                if ((!((FName(local_64.TimeParameterName) == NAME_None))))
                                {
                                    local_50.SetVariableFloat(local_64.TimeParameterName, FFXUtils::GetNiagaraComponentAge(local_50));
                                }
                                continue;
                            }
                            FFXUtils::SetNiagaraComponentOverrideParam(nullptr, local_50, local_64.ParamName, local_64.ParamValue);
                        }
                    }
                }
            }
        }
    }
    return;
}
UFUNCTION()
void ReinitializeNiagaraComponent(const FECSEntity &inout Entity, const FC_VisualComponentToggleConfig &inout VisualComponentToggleConfig, const TArray<FName> &inout LogicNames)
{
    UNiagaraComponent local_44;
    AGameActor local_6 = (Cast<AGameActor>(Entity.GetActor()));
    if (local_6 == nullptr)
    {
        return;
    }
    for (auto& local_22 : LogicNames)
    {
        for (auto local_40 : local_6.GetCachedSceneComponentByLogicName(local_22))
        {
            local_44 = Cast<UNiagaraComponent>(local_40);
            if (local_44 != nullptr)
            {
                local_44.DeactivateImmediate();
                local_44.ReinitializeSystem();
                FFXUtils::ResetNiagaraComponentOverrideParametersToDefault(local_44);
                FVisualComponentToggleUtils::InitGameActorFXParamOverrideByLogicName(local_6, VisualComponentToggleConfig, local_22);
            }
        }
    }
    return;
}
EFXOffsetSpace ToEFXOffsetSpace(const EFXOffsetSpaceWithAttachmentOption OffsetSpace)
{
    switch (int(OffsetSpace))
    {
    case 0:
    {
        return EFXOffsetSpace(0);
    }
    case 1:
    {
        return EFXOffsetSpace(1);
    }
    case 2:
    {
        return EFXOffsetSpace(2);
    }
    default:
    {
    }
    }
    return EFXOffsetSpace(0);
}
}
