

class UESMAction_ClearSelectHint : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bClearAtEnter = true;
    UPROPERTY()
    bool bClearAtExit = true;


    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.bClearAtEnter)
        {
            this.ClearSelectSocialInteractionInfo(::FASCommonUtils::GetUniquePlayerEntity(Context.GetEntity()));
        }
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.bClearAtExit)
        {
            this.ClearSelectSocialInteractionInfo(::FASCommonUtils::GetUniquePlayerEntity(Context.GetEntity()));
        }
        return;
    }
    void ClearSelectSocialInteractionInfo(const FECSEntity &inout Entity) const
    {
        if ((::FASCommonUtils::GetLocalPlayerProxy() == ::FASCommonUtils::GetUniquePlayerEntity(Entity)))
        {
            Modify local_18;
            FC_SelectSocialInteractionInfo& local_20 = local_18.opCall();
            if (local_20)
            {
                local_20.InteractTarget = ENTITY_NULL;
            }
        }
        return;
    }
}

