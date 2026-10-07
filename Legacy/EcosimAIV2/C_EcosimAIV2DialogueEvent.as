
namespace __INTENRAL_FCE_EcosimAIV2InteractDialogueEvent_NS
{
    const TECSEventDerivedPtr<FCE_EcosimAIV2InteractDialogueEvent> DerivedPtr = TECSEventDerivedPtr<FCE_EcosimAIV2InteractDialogueEvent>();
}
namespace __INTENRAL_FCE_EcosimAIV2DialogueSelectEvent_NS
{
    const TECSEventDerivedPtr<FCE_EcosimAIV2DialogueSelectEvent> DerivedPtr = TECSEventDerivedPtr<FCE_EcosimAIV2DialogueSelectEvent>();
}
namespace __INTENRAL_FCE_EcosimAIV2DialogueEndEvent_NS
{
    const TECSEventDerivedPtr<FCE_EcosimAIV2DialogueEndEvent> DerivedPtr = TECSEventDerivedPtr<FCE_EcosimAIV2DialogueEndEvent>();
}
namespace __INTENRAL_FCE_EcosimAIV2ClientDialogueSelectEvent_NS
{
    const TECSEventDerivedPtr<FCE_EcosimAIV2ClientDialogueSelectEvent> DerivedPtr = TECSEventDerivedPtr<FCE_EcosimAIV2ClientDialogueSelectEvent>();
}
namespace __INTENRAL_FCE_EcosimAIV2UpdateDialogueSyncDataForAllPlayerEvent_NS
{
    const TECSEventDerivedPtr<FCE_EcosimAIV2UpdateDialogueSyncDataForAllPlayerEvent> DerivedPtr = TECSEventDerivedPtr<FCE_EcosimAIV2UpdateDialogueSyncDataForAllPlayerEvent>();

}
struct FCE_EcosimAIV2InteractDialogueEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity InteractSource;
    UPROPERTY()
    FECSEntity InteractTarget;

    FCE_EcosimAIV2InteractDialogueEvent()
    {
        return;
    }
}

struct FCE_EcosimAIV2DialogueSelectEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity InteractSource;
    UPROPERTY()
    FECSEntity InteractTarget;
    UPROPERTY()
    int OptionIndex = -1;


}

struct FCE_EcosimAIV2DialogueEndEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity InteractSource;
    UPROPERTY()
    FECSEntity InteractTarget;
    UPROPERTY()
    TDataObjectPtr<FInteractSimpleSpeakToAndOption> CurrentSpeakToAndOption;

    FCE_EcosimAIV2DialogueEndEvent()
    {
        return;
    }
}

struct FCE_EcosimAIV2ClientDialogueSelectEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    int CurrentSectionIndex;


}

struct FCE_EcosimAIV2UpdateDialogueSyncDataForAllPlayerEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_EcosimAIV2UpdateDialogueSyncDataForAllPlayerEvent()
    {
        return;
    }
}

