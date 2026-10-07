

class US_ThrowPredictBlendSystem : UECSScriptSystem
{
    US_ThrowPredictBlendSystem()
    {
        return;
    }
    UFUNCTION()
    void Monitor_ThrowPredictBlendStart(const FECSEntity &inout Entity, const FC_ThrowPredictBlendInTime &inout ThrowPredictBlendIn) const
    {
        int local_8 = 0;
        int local_34 = 0;
        FECSWorldPtr local_2 = Entity.GetWorld();
        FInterpoBlendData local_18;
        local_18.SetLastWorldTime(local_8.Time);
        local_18.SetWorldTime((FFPTime(local_8.Time) + FFPTime(ThrowPredictBlendIn.GetBlendServerToPredictTime())));
        local_18.SetLastBlendScale(1.0f);
        local_18.SetBlendScale(0.0f);
        local_34.SetInterpoBlendData(local_18, local_8.Time);
        return;
    }
    UFUNCTION()
    void Monitor_ThrowPredictBlendStop(const FECSEntity &inout Entity, const FC_ThrowPredictBlendOutTime &inout ThrowPredictBlendOut) const
    {
        int local_8 = 0;
        int local_34 = 0;
        FECSWorldPtr local_2 = Entity.GetWorld();
        FInterpoBlendData local_18;
        local_18.SetLastWorldTime(local_8.Time);
        local_18.SetWorldTime((FFPTime(local_8.Time) + FFPTime(ThrowPredictBlendOut.GetBlendPredictToServerTime())));
        local_18.SetLastBlendScale(0.0f);
        local_18.SetBlendScale(1.0f);
        local_34.SetInterpoBlendData(local_18, local_8.Time);
        return;
    }
    UFUNCTION()
    void Run_Monitor_ThrowPredictBlendStart() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorThrowPredictBlendInTimeOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ThrowPredictBlendStart(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ThrowPredictBlendStop() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorThrowPredictBlendOutTimeOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ThrowPredictBlendStop(local_46, local_52);
        }
        return;
    }
}

