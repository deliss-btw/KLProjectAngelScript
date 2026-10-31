struct FAICommand_DisableStrafe : FAICommandScript
{
    FAICommandScript _base_FAICommandScript;

    default m_ScriptOverrideMeta = Cast<UASStruct>(FAICommand_DisableStrafe.Get());

    FAICommand_DisableStrafe()
    {
        this.__InitDefaults();
        return;
    }
    void Execute_Implementation(const FAICommandParams &inout Params, const FFPTime &inout WorldTime) const
    {
        int local_12 = 0;
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            local_12.SetKeepStrafeCounter((local_12.GetKeepStrafeCounter() - 1));
            FESMTriggerUtils::ActivateESMTrigger(Params.GetPawnProxy(), n"KeepStrafeCounterTrigger", WorldTime, FFPTime(0.1), 0);
        }
        return;
    }
    void Finish_Implementation(const FAICommandParams &inout Params, const FFPTime &inout WorldTime) const
    {
        int local_12 = 0;
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            local_12.SetKeepStrafeCounter((local_12.GetKeepStrafeCounter() + 1));
            FESMTriggerUtils::ActivateESMTrigger(Params.GetPawnProxy(), n"KeepStrafeCounterTrigger", WorldTime, FFPTime(0.1), 0);
        }
        return;
    }
}

class UBTService_DisableStrafe : UBTService_AICommandScript
{
    UPROPERTY()
    FAICommand_DisableStrafe AICommand;

    default SetNodeName("期间退出Strafe状态");

    UBTService_DisableStrafe()
    {
        return;
    }
}

