
const FConsoleVariable CVar_EnvImpact_Debug = FConsoleVariable();
const FConsoleVariable CVar_EnvImpact_SwitchLineTrace = FConsoleVariable();
const FConsoleVariable CVar_EnvImpact_ShowDiscardGroundNormal = FConsoleVariable();
const FConsoleVariable CVar_VfxSurfaceContact = FConsoleVariable();

class US_EnvSurfaceImpactSystem : UECSScriptSystem
{
    US_EnvSurfaceImpactSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_CheckEnvironmentSurfaceHit(const FCE_CheckEnvSurfaceHit &inout Event, const FCS_LocalTime &inout LocalTime) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_CheckEnvSurfaceFxPresentation(const FCE_EnvSurfaceImpactFXEvent &inout Event, const FCS_LocalTime &inout LocalTime) const
    {
        ::FEnvSurfaceImpactUtils::ShowEnvSurfaceImpact_Effect(Event, ::FEnvSurfaceImpactUtils::EnableLog(), FEnvSurfaceImpactUtils::CVar_EnvSurfaceImpact_PrintToScreen.GetBool());
        return;
    }
    UFUNCTION()
    void Run_Job_CheckEnvironmentSurfaceHit() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        TECSEventConstIterator<FCE_CheckEnvSurfaceHit> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_CheckEnvSurfaceHit& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.Job_CheckEnvironmentSurfaceHit(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CheckEnvSurfaceFxPresentation() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        TECSEventConstIterator<FCE_EnvSurfaceImpactFXEvent> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_EnvSurfaceImpactFXEvent& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.Job_CheckEnvSurfaceFxPresentation(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

