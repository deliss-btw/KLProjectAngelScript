class US_CommonTips : UECSScriptSystem
{
    US_CommonTips()
    {
        return;
    }
    UFUNCTION()
    void ClientJob_OnCommonPopupManagerChanged(const FCE_NotifyCommonPopupManagerChanged &inout Event, FCS_CommonTipsManager &inout Manager, const FCS_LocalPlayer &inout C_LocalPlayer) const
    {
        ECommonTipsType local_17;
        if (!(this.AffectsTips(Event.AffectedPopupTypes)))
        {
            return;
        }
        for (auto local_16 : Event.RemovedPopupIds)
        {
            if (this.FindDisplayingTypeByPopupId(Manager, int(local_16), local_17))
            {
                ::CommonPopup_Internal::CloseTipsByViewRef(Manager.DisplayingTips[local_17].ViewRef);
                Manager.DisplayingTips.Remove(local_17);
                continue;
            }
            Manager.PendingTips.Remove(local_16);
        }
        ULocalPlayer local_20 = C_LocalPlayer.UEPlayerController.GetLocalPlayer();
        for (auto local_23 : Event.NewDisplayingPopupIds)
        {
            FPendingCommonTipsInfo local_46;
            if (Manager.PendingTips.RemoveAndCopyValue(local_23, local_46))
            {
                FEUIWidgetRef local_52 = ::CommonPopup_Internal::CreateTipsWidget(local_20, local_46.Type, local_46.Content, local_46.TypeSpecificModels);
                if (!(local_52.IsValid()))
                {
                    ::CommonPopupUtils::DequeuePopupInternal(local_23);
                    continue;
                }
                FDisplayingCommonTipsInfo local_64;
                local_64.ViewRef = local_52;
                local_64.PopupId = local_23;
                local_64.Content = local_46.Content;
                local_64.OpenTime = ECS::GetContextTime();
                local_64.Lifetime = local_46.Lifetime;
                Manager.DisplayingTips.Add(local_46.Type, local_64);
            }
        }
        return;
    }
    bool AffectsTips(const TSet<FGameplayTag> &inout AffectedTypes) const
    {
        return ::CommonPopupUtils::HasMatchingPopupType(AffectedTypes, ::CommonPopup_Internal::GetTipsPopupType(ECommonTipsType(0))) || ::CommonPopupUtils::HasMatchingPopupType(AffectedTypes, ::CommonPopup_Internal::GetTipsPopupType(ECommonTipsType(1))) || ::CommonPopupUtils::HasMatchingPopupType(AffectedTypes, ::CommonPopup_Internal::GetTipsPopupType(ECommonTipsType(2)));
    }
    bool FindDisplayingTypeByPopupId(FCS_CommonTipsManager &inout Manager, const int PopupId, ECommonTipsType &inout OutType) const
    {
        for (auto& local_20 : Manager.DisplayingTips)
        {
            if ((local_20.GetValue().PopupId) == PopupId)
            {
                OutType = ECommonTipsType(local_20.GetKey());
                return true;
            }
        }
        return false;
    }
    UFUNCTION()
    void ClientJob_TickCommonTips(FCS_CommonTipsManager &inout Manager, const FCS_LocalPlayer &inout LocalPlayer) const
    {
        if (!(Manager.DisplayingTips.IsEmpty()))
        {
            FFPTime local_6 = ECS::GetContextTime();
            TArray<ECommonTipsType> local_10;
            for (auto& local_28 : Manager.DisplayingTips)
            {
                if ((local_6 - local_28.GetValue().OpenTime).ToSeconds() > local_28.GetValue().Lifetime)
                {
                    local_10.Add(local_28.GetKey());
                    ::CommonPopup_Internal::CloseTipsByViewRef(local_28.GetValue().ViewRef);
                    ::CommonPopupUtils::DequeuePopupInternal(local_28.GetValue().PopupId);
                }
            }
            for (auto& local_50 : local_10)
            {
                Manager.DisplayingTips.Remove(int(local_50));
            }
        }
        if (Manager.PendingTips.IsEmpty() && Manager.DisplayingTips.IsEmpty())
        {
            FECSWorldPtr local_54 = ECS::GetECSWorld();
            Remove local_58;
            local_58.opCall();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_OnCommonPopupManagerChanged() const
    {
        int local_16 = 0;
        int local_22 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        Has local_14;
        if (!(local_14.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_3 = this.GetECSWorld();
        FECSWorldPtr local_4_4 = this.GetECSWorld();
        TECSEventConstIterator<FCE_NotifyCommonPopupManagerChanged> local_58 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_58.CanProceed;)
        {
            const FCE_NotifyCommonPopupManagerChanged& local_80 = local_58.Proceed();
            FECSEntityScopeCycleCounter local_81 = FECSEntityScopeCycleCounter(local_80.Sender);
            ECSInternal::PushContextTime(local_80.GetHandleTime());
            this.ClientJob_OnCommonPopupManagerChanged(local_80, local_16, local_22);
            ECSInternal::PopContextTime();
        }
        FECSWorldPtr local_4_5 = this.GetECSWorld();
        MarkModifiedIfDirty local_88;
        local_88.opCall(local_16);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TickCommonTips() const
    {
        int local_16 = 0;
        int local_22 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        Has local_14;
        if (!(local_14.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_3 = this.GetECSWorld();
        FECSWorldPtr local_4_4 = this.GetECSWorld();
        this.ClientJob_TickCommonTips(local_16, local_22);
        FECSWorldPtr local_4_5 = this.GetECSWorld();
        MarkModifiedIfDirty local_30;
        local_30.opCall(local_16);
        return;
    }
}

