
namespace PostProcessUtils
{
void PlayCameraPostProcessAnim(const FECSEntity &inout ToEntity, const FECSEntity &inout AttachEntity, const bool bUpdateAttach, const UCameraPostProcessAnimConfig AnimConfig, const float32 Duration, const FName &inout AttachSocketName = NAME_None, const FVector &inout AttachOffset = FVector::ZeroVector)
{
    int local_8 = 0;
    int local_22 = 0;
    if ((!(AnimConfig != nullptr || !(ToEntity))))
    {
        return;
    }
    if (!(local_8))
    {
        return;
    }
    if (!(FECSEntity(local_8.GetPlayerEntity())))
    {
        return;
    }
    for (auto& local_36 : local_22.GetModify_Anims())
    {
        if ((local_36.GetConfig() == AnimConfig))
        {
            local_36.SetbUpdateAttach(bUpdateAttach);
            local_36.SetAttachEntity(AttachEntity);
            local_36.SetStartTime(ECS::GetContextTime());
            local_36.SetDuration(FFPTime(Duration));
            return;
        }
    }
    FCameraPostProcessAnimRange local_80;
    local_80.SetbUpdateAttach(bUpdateAttach);
    local_80.SetAttachSocketName(AttachSocketName);
    local_80.SetAttachOffset(AttachOffset);
    local_80.SetAttachEntity(AttachEntity);
    local_80.SetConfig(TSoftObjectPtr<UCameraPostProcessAnimConfig>(AnimConfig));
    local_80.SetStartTime(ECS::GetContextTime());
    local_80.SetDuration(FFPTime(Duration));
    local_22.GetModify_Anims().Add(local_80);
    return;
}
void StopCameraPostProcessAnim(const FECSEntity &inout ToEntity, const UCameraPostProcessAnimConfig AnimConfig)
{
    int local_8 = 0;
    int local_22 = 0;
    if ((!(AnimConfig != nullptr || !(ToEntity))))
    {
        return;
    }
    if (!(local_8))
    {
        return;
    }
    if (!(FECSEntity(local_8.GetPlayerEntity())))
    {
        return;
    }
    int local_23 = 0;
    for (; local_23 < local_22.GetModify_Anims().Num(); ++local_23)
    {
        FCameraPostProcessAnimRange& local_28 = local_22.GetModify_Anims()[local_23];
        TSoftObjectPtr<UCameraPostProcessAnimConfig> local_38;
        local_38 = local_28.GetConfig();
        if ((local_38 == AnimConfig))
        {
            float32 local_39;
            local_39 = AnimConfig.PostProcessAnim.FadeOutDuration;
            if (local_39 > 0.0f)
            {
                FFPTime local_44 = (ECS::GetContextTime() - local_28.GetStartTime());
                local_28.SetDuration((local_44 + FFPTime(local_39)));
            }
            else
            {
                local_22.GetModify_Anims().RemoveAt(local_23);
            }
            return;
        }
    }
    return;
}
void PlayCameraPostProcessRadius(const FECSEntity &inout Entity, const float32 Radius, const int RelationMask, const bool bUpdateAttach, const UCameraPostProcessAnimConfig AnimConfig, const float32 Duration = 4.f, const FName &inout AttachSocketName = NAME_None, const FVector &inout AttachOffset = FVector::ZeroVector)
{
    bool local_11;
    int local_102 = 0;
    Get local_4;
    FVector local_10 = local_4.opCall().GetPosition();
    FECSRuntimeQuery local_52 = FECSRuntimeQueryHelper::RuntimeQueryInSphere(Entity, local_10, Radius, EECSQueryRegsitryType(3), false);
    Include local_96;
    local_96.opCall();
    if (local_102 && (int(local_102.GetFactionId()) != 0))
    {
        local_52 = local_52.FilterByFaction(EFaction(local_102.GetFactionId()));
    }
    FECSRuntimeQueryIterator local_130 = local_52.Iterator();
    for (; local_130.CanProceed;)
    {
        const FECSEntity& local_154 = local_130.Proceed();
        if ((local_154 == Entity))
        {
            continue;
        }
        local_11 = ECS::GetRuntimeInfo().IsServer;
        if (local_11)
        {
            local_11 = true;
        }
        else
        {
            Has local_158;
            local_11 = local_158.opCall();
        }
        if (local_11)
        {
            PostProcessUtils::PlayCameraPostProcessAnim(local_154, Entity, bUpdateAttach, AnimConfig, Duration, AttachSocketName, AttachOffset);
        }
    }
    return;
}
}
