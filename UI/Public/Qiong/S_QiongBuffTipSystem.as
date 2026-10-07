

class US_QiongBuffTipSystem : UECSScriptSystem
{
    UPROPERTY()
    TSubclassOf<UEUIUserWidget> QiongBuffUIWidgetClass;

    US_QiongBuffTipSystem()
    {
        return;
    }
    UFUNCTION()
    void Monitor_QiongBuffTipIndicator(const FECSEntity &inout Entity, const FC_QiongBuffIndicator &inout QiongBuffIndicator) const
    {
        int local_16 = 0;
        if ((!((FECSEntity(QiongBuffIndicator.GetFromEntity()) == ::FASCommonUtils::GetControlledPawnEntity(::FASCommonUtils::GetLocalUniquePlayerEntity())))))
        {
            return;
        }
        if (QiongBuffIndicator)
        {
            FEUIModelRef local_34 = FEUIModelRef(::FVM_Qiong_BuffTip::Create(this.GetOwner(), QiongBuffIndicator.GetFromEntity(), Entity, QiongBuffIndicator.GetBuffConfig(), QiongBuffIndicator.GetOffset()));
            UClass local_26;
            TSoftClassPtr<UEUIUserWidget> local_44 = TSoftClassPtr<UEUIUserWidget>(local_26);
            FECSWorldPtr local_28 = ECS::GetECSWorld();
            Get local_32;
            local_16.Handle = FEUIWidget::AddWidgetByClass(local_32.opCall().UEPlayerController.GetLocalPlayer(), local_44, local_34);
        }
        else
        {
            FEUIWidget::RemoveWidget(local_16.Handle);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_QiongBuffTipIndicator() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorQiongBuffIndicatorOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_QiongBuffTipIndicator(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorQiongBuffIndicatorOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_QiongBuffTipIndicator(local_46, local_52);
        }
        return;
    }
}

