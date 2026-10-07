
namespace FAbilityUtils
{
bool CanTriggerAbilityEffectEvent(const FECSEntity &inout TriggerEntity, const EAbilityEffectEvent EventType)
{
    bool local_1 = false;
    Get local_6;
    const FC_AbilityEffectEventTriggerConfig& local_8 = local_6.opCall();
    if (local_8)
    {
        local_1 = local_8.CanTriggerEvent(EAbilityEffectEvent(EventType));
    }
    if (!(local_1))
    {
        Get local_12;
        const FC_AbilityEffectEventTrigger& local_14 = local_12.opCall();
        if (local_14)
        {
            local_1 = local_14.CanTriggerEvent(EAbilityEffectEvent(EventType));
        }
    }
    return local_1;
}
void TryTriggerAbilityEffectEvent(const FECSEntity &inout TriggerEntity, const FECSEntity &inout ReceiverEntity, const EAbilityEffectEvent EventType, const FFPTime &inout EventTime, const UScriptStruct EventDataType, const FAbilityEffectEventDataBase &inout EventData)
{
    Get local_4;
    const FC_AbilityEffectEventTriggerConfig& local_6 = local_4.opCall();
    if (local_6)
    {
        FAbilityUtils::TriggerAbilityEffectEventByConfig(ReceiverEntity, local_6, EAbilityEffectEvent(EventType), EventTime, EventDataType, EventData);
    }
    Get local_12;
    const FC_AbilityEffectEventTrigger& local_14 = local_12.opCall();
    if (local_14)
    {
        FAbilityUtils::TriggerAbilityEffectEvent(local_14, EAbilityEffectEvent(EventType), EventTime, EventDataType, EventData);
    }
    return;
}
}
