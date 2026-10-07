
namespace LocalPlayerEffectUtils
{
void LocalPlayForceFeedback(const UForceFeedbackEffect ForceFeedbackEffect, const FName &inout Tag, const bool bLooping, const bool bIgnoreTimeDilation, const bool bPlayWhilePaused)
{
    if ((int(UICommonUtil::GetCurrentInputType(nullptr))) == 0)
    {
        return;
    }
    APlayerController local_6 = FASCommonUtils::GetLocalPlayerController();
    if ((local_6 != nullptr && (ForceFeedbackEffect != nullptr)))
    {
        local_6.ClientPlayForceFeedback(ForceFeedbackEffect, Tag, bLooping, bIgnoreTimeDilation, bPlayWhilePaused);
    }
    return;
}
}
