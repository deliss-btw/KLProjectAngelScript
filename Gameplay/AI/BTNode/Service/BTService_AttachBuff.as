

// NOTE: class defaults are not authored in this module: FAICommand_AttachBuff (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

struct FAICommand_AttachBuff : FAICommandScript
{
    FAICommandScript _base_FAICommandScript;
    UPROPERTY()
    FBuffConfigRef BuffConfig;
    UPROPERTY()
    bool bAddBuffOnEnter;
    UPROPERTY()
    bool bRemoveBuffOnExit;

    FAICommand_AttachBuff()
    {
        this.bAddBuffOnEnter = true;
        this.bRemoveBuffOnExit = true;
        this.__InitDefaults();
        return;
    }
    void Execute_Implementation(const FAICommandParams &inout Params, const FFPTime &inout WorldTime) const
    {
        if (this.bAddBuffOnEnter)
        {
            FBuffUtils::AddBuff(Params.GetPawnProxy(), this.BuffConfig, WorldTime, Params.GetPawnProxy(), false, -1.0f, 1, false);
        }
        return;
    }
    void Finish_Implementation(const FAICommandParams &inout Params, const FFPTime &inout WorldTime) const
    {
        if (this.bRemoveBuffOnExit)
        {
            FBuffUtils::RemoveBuff(Params.GetPawnProxy(), this.BuffConfig, WorldTime, EBuffEndType(0));
        }
        return;
    }
}

class UBTService_AttachBuff : UBTService_AICommandScript
{
    UPROPERTY()
    FAICommand_AttachBuff AICommand;

    UBTService_AttachBuff()
    {
        return;
    }
}

