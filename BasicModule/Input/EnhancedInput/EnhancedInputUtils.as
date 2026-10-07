
namespace EnhancedInputUtils
{
void AddInputContext(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FEnhancedInputContextConfig> &inout InputContextConfig)
{
    if (ECS::GetRuntimeInfo().IsServer)
    {
        return;
    }
    if (ECS::IsFixedFrameJob())
    {
        FCE_NotifyEnableInputContext local_12;
        FFPTime local_8 = FFPTime(-1);
        local_12.InputContextConfig = InputContextConfig;
        local_12.bEnable = true;
        return;
    }
    UKLEnhancedInputManagerSubsystem::Get(FASCommonUtils::GetLocalPlayerController().GetLocalPlayer()).RequireInputContext(InputContextConfig.opImplConv());
    return;
}
void RemoveInputContext(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FEnhancedInputContextConfig> &inout InputContextConfig)
{
    if (ECS::GetRuntimeInfo().IsServer)
    {
        return;
    }
    if (ECS::IsFixedFrameJob())
    {
        FCE_NotifyEnableInputContext local_12;
        FFPTime local_8 = FFPTime(-1);
        local_12.InputContextConfig = InputContextConfig;
        local_12.bEnable = false;
        return;
    }
    UKLEnhancedInputManagerSubsystem::Get(FASCommonUtils::GetLocalPlayerController().GetLocalPlayer()).ReleaseInputContext(InputContextConfig.opImplConv());
    return;
}
void EnableTag(const FECSEntity &inout PlayerEntity, const FGameplayTag &inout Tag)
{
    if (ECS::GetRuntimeInfo().IsServer)
    {
        return;
    }
    if (ECS::IsFixedFrameJob())
    {
        FCE_NotifyEnableInputContextTag local_12;
        FFPTime local_8 = FFPTime(-1);
        local_12.Tag = Tag;
        local_12.bEnable = true;
        return;
    }
    UKLEnhancedInputManagerSubsystem::Get(FASCommonUtils::GetLocalPlayerController().GetLocalPlayer()).ResetTagToEnabled(Tag);
    return;
}
void DisableTag(const FECSEntity &inout PlayerEntity, const FGameplayTag &inout Tag)
{
    if (ECS::GetRuntimeInfo().IsServer)
    {
        return;
    }
    if (ECS::IsFixedFrameJob())
    {
        FCE_NotifyEnableInputContextTag local_12;
        FFPTime local_8 = FFPTime(-1);
        local_12.Tag = Tag;
        local_12.bEnable = false;
        return;
    }
    UKLEnhancedInputManagerSubsystem::Get(FASCommonUtils::GetLocalPlayerController().GetLocalPlayer()).RequireDisableTag(Tag);
    return;
}
}
