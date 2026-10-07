

UCLASS(Abstract)
class UInteractionBehavior_SocialBase : UInteractionBehaviorBase
{
    default InteractType = EInteractType(3);

    UInteractionBehavior_SocialBase()
    {
        super();
        return;
    }
    bool CheckBehaviorConditions(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget) const
    {
        int local_14 = 0;
        int local_20 = 0;
        FECSEntity local_8 = ::FASCommonUtils::GetUniquePlayerEntity(InteractTarget);
        FECSEntity local_4 = ::FASCommonUtils::GetUniquePlayerEntity(InteractSource);
        if (::FASCommonUtils::IsTargetEntityEnemy(InteractSource, InteractTarget) || !(local_20) || !(local_14) || (local_4 == local_8))
        {
            return false;
        }
        if (!(this.CheckSocialInteractionConditions(InteractSource, InteractTarget, local_20, local_14)))
        {
            return false;
        }
        return Super::CheckBehaviorConditions(InteractSource, InteractTarget);
    }
    bool CheckSocialInteractionConditions(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FC_SocialInteractionInfo &inout Source_SocialInteractionInfo, const FC_SocialInteractionInfo &inout Target_SocialInteractionInfo) const
    {
        return true;
    }
}

UCLASS(Abstract)
class UInteractionBehavior_LinkRequest : UInteractionBehavior_SocialBase
{
    UInteractionBehavior_LinkRequest()
    {
        super();
        return;
    }
    bool CheckBehaviorConditions(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget) const
    {
        return false;
    }
}

UCLASS(Abstract)
class UInteractionBehavior_AcceptLinkRequest : UInteractionBehavior_SocialBase
{
    UInteractionBehavior_AcceptLinkRequest()
    {
        super();
        return;
    }
    bool CheckBehaviorConditions(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget) const
    {
        return false;
    }
}

UCLASS(Abstract)
class UInteractionBehavior_AcceptInteractActionRequest : UInteractionBehavior_SocialBase
{
    UInteractionBehavior_AcceptInteractActionRequest()
    {
        super();
        return;
    }
    void ExecuteBeginAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex, const bool bPresentationOnly = false)
    {
        int local_28 = 0;
        int local_30 = 0;
        int local_31;
        int local_38 = 0;
        int local_46 = 0;
        int local_54 = 0;
        if (ECS::GetRuntimeInfo().IsClient)
        {
            return;
        }
        FECSEntity local_6 = InteractSource;
        FECSEntity local_10 = InteractTarget;
        ::FASCommonUtils::GetUniquePlayerEntity(local_10);
        ::FASCommonUtils::GetUniquePlayerEntity(local_6);
        local_31 = int(local_30.GetSocialAnimName());
        local_38.SetSocialAnimName(EInteractionSocialTypeForESM(local_31));
        FNameHandle_EntityBBVarBool local_44;
        local_44;
        local_6.SetBB_Bool(local_44, n"bSocialInteractionHost");
        local_46.SetSocialAnimName(EInteractionSocialTypeForESM(local_31));
        local_44;
        local_10.SetBB_Bool(local_44, n"bSocialInteractionHost");
        local_28.SetIsInteractMaster(false);
        local_30.SetRequestInteractActionTargetPlayerEntity(ENTITY_NULL);
        local_30.SetbHasTargetPlayerEntity(false);
        local_30.SetRequestInteractActionIndex(-1);
        local_30.SetIsInteractMaster(true);
        Super::ExecuteBeginAction(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex, bPresentationOnly);
        Get local_52;
        const FC_InteractionInfoForESM& local_48 = local_52.opCall();
        if (local_48)
        {
            Get local_60;
            local_54.SetInteractType(local_48.GetInteractType());
            local_54.SetSubType(local_48.GetSubType());
            local_54.SetbIsSecondaryInteractSource(false);
            local_54.SetInteractTargetLocation(local_60.opCall().GetPosition());
            local_54.SetInteractTargetRotation(local_60.opCall().GetRotation().Rotator());
            local_54.SetTargetEntity(InteractSource);
            local_54.SetTargetPointAndBehaviorIndex(InteractTargetPointAndBehaviorIndex);
            local_54.SetExpireTime(local_48.GetExpireTime());
        }
        return;
    }
    bool CheckSocialInteractionConditions(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FC_SocialInteractionInfo &inout Source_SocialInteractionInfo, const FC_SocialInteractionInfo &inout Target_SocialInteractionInfo) const
    {
        if ((FECSEntity(Target_SocialInteractionInfo.GetRequestInteractActionTargetPlayerEntity()) == ENTITY_NULL) || (FECSEntity(Target_SocialInteractionInfo.GetRequestInteractActionTargetPlayerEntity()) == ::FASCommonUtils::GetUniquePlayerEntity(InteractSource)))
        {
            return Super::CheckSocialInteractionConditions(InteractSource, InteractTarget, Source_SocialInteractionInfo, Target_SocialInteractionInfo);
        }
        return false;
    }
}

UCLASS(Abstract)
class UInteractionBehavior_TryRequestInteractAction : UInteractionBehavior_SocialBase
{
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> PageWidget;
    UPROPERTY()
    int PageIndex;

    UInteractionBehavior_TryRequestInteractAction()
    {
        super();
        return;
    }
    void ExecuteBeginAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex, const bool bPresentationOnly = false)
    {
        FCS_FixedTime local_24;
        int local_38 = 0;
        Super::ExecuteBeginAction(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex, bPresentationOnly);
        if (ECS::GetRuntimeInfo().IsServer)
        {
            return;
        }
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        ::FASCommonUtils::GetUniquePlayerEntity(InteractSource);
        FECSEntity local_14 = ::FASCommonUtils::GetUniquePlayerEntity(InteractTarget);
        local_4.IsValid();
        if (!(local_24.bClientSingularTick))
        {
            return;
        }
        FCE_UISetMotionIndex local_30;
        local_30.PageIndex = this.PageIndex;
        local_38.InteractTarget = local_14;
        return;
    }
    bool CheckSocialInteractionConditions(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FC_SocialInteractionInfo &inout Source_SocialInteractionInfo, const FC_SocialInteractionInfo &inout Target_SocialInteractionInfo) const
    {
        FECSEntity local_8 = ::FASCommonUtils::GetUniquePlayerEntity(InteractSource);
        FECSEntity local_4 = ::FASCommonUtils::GetUniquePlayerEntity(InteractTarget);
        if ((FECSEntity(Target_SocialInteractionInfo.GetRequestInteractActionTargetPlayerEntity()) == local_8))
        {
            return false;
        }
        if ((FECSEntity(Source_SocialInteractionInfo.GetRequestInteractActionTargetPlayerEntity()) == local_4))
        {
            return false;
        }
        return Super::CheckSocialInteractionConditions(InteractSource, InteractTarget, Source_SocialInteractionInfo, Target_SocialInteractionInfo);
    }
}

UCLASS(Abstract)
class UInteractionBehavior_AutoLink : UInteractionBehaviorBase
{
    UInteractionBehavior_AutoLink()
    {
        super();
        return;
    }
}

