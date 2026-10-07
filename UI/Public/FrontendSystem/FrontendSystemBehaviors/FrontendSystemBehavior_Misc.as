

class UFrontendSystemBehavior_ClearSelectSocialInteractionInfo : UFrontendSystemBehaviorBase
{
    UFrontendSystemBehavior_ClearSelectSocialInteractionInfo()
    {
        super();
        return;
    }
    void OnExit(const FFrontendSystemContext &inout Context, FInstancedStruct &inout BehaviorInstance) const
    {
        Modify local_4;
        FC_SelectSocialInteractionInfo& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.InteractTarget = ENTITY_NULL;
        }
        return;
    }
}

class UFrontendSystemBehavior_ClearAllHover : UFrontendSystemBehaviorBase
{
    UFrontendSystemBehavior_ClearAllHover()
    {
        super();
        return;
    }
    void OnExit(const FFrontendSystemContext &inout Context, FInstancedStruct &inout BehaviorInstance) const
    {
        ::CommonPopup::CloseAllHover();
        return;
    }
}

