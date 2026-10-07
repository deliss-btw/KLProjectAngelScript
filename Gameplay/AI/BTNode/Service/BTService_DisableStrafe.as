

// NOTE: class defaults are not authored in this module: FAICommand_DisableStrafe (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

struct FAICommand_DisableStrafe : FAICommandScript
{
    FAICommandScript _base_FAICommandScript;

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

    UBTService_DisableStrafe()
    {
        return;
    }
}

