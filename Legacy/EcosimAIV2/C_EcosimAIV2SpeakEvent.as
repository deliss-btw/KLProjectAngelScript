
namespace __INTENRAL_FCE_EcosimAIV2PublicSpeakByData_NS
{
    const TECSEventDerivedPtr<FCE_EcosimAIV2PublicSpeakByData> DerivedPtr = TECSEventDerivedPtr<FCE_EcosimAIV2PublicSpeakByData>();
}
namespace __INTENRAL_FCE_EcosimAIV2ClearPublicSpeakDataKeyTimeRecord_NS
{
    const TECSEventDerivedPtr<FCE_EcosimAIV2ClearPublicSpeakDataKeyTimeRecord> DerivedPtr = TECSEventDerivedPtr<FCE_EcosimAIV2ClearPublicSpeakDataKeyTimeRecord>();

}
struct FCE_EcosimAIV2PublicSpeakByData : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TDataObjectPtr<FEcosimAIV2LLMPublicSpeakData> SpeakData;

    FCE_EcosimAIV2PublicSpeakByData()
    {
        return;
    }
}

struct FCE_EcosimAIV2ClearPublicSpeakDataKeyTimeRecord : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TDataObjectPtr<FEcosimAIV2LLMPublicSpeakData> SpeakData;

    FCE_EcosimAIV2ClearPublicSpeakDataKeyTimeRecord()
    {
        return;
    }
}

