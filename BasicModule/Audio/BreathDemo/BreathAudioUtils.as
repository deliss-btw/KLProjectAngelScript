enum EBreathAudioState
{
    Idle,
    Walk,
    Run,
    Sprint,
}

enum ECharacterReactionSoundType
{
    Immediately,
    WaitForBreath,
}

struct FBreathAudioWeightConfig
{
    UPROPERTY()
    float32 MaxBreathWeight = 0.0f;
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> BreathAudioEvent;

}

struct FBreathAudioBlendKey
{
    UPROPERTY()
    EBreathAudioState FromState;
    UPROPERTY()
    EBreathAudioState ToState;

    FBreathAudioBlendKey(const EBreathAudioState InFromState, const EBreathAudioState InToState)
    {
        this.FromState = InFromState;
        this.ToState = InToState;
        return;
    }
    uint Hash() const
    {
        return (HashCombine(int(this.FromState), int(this.ToState)));
    }
}

class UBreathAudioSettings : UDataAsset
{
    UPROPERTY()
    UAkRtpc HeartRateRtpc;
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> BreathAudioEvent;
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> BreathStopAudioEvent;
    UPROPERTY()
    TMap<EBreathAudioState, float32> BreathAudioStateWeightMap = {{EBreathAudioState(0), 0.0f}, {EBreathAudioState(1), 0.1f}, {EBreathAudioState(2), 0.3f}, {EBreathAudioState(3), 0.6f}};
    UPROPERTY()
    float32 CombatAdditiveWeight = 0.3f;
    UPROPERTY()
    TMap<FBreathAudioBlendKey, float32> CustomBlendSpeeds;
    UPROPERTY()
    float32 DefaultBlendSpeed = 0.02f;

}

class UBreathAudioSubsystem : UWorldSubsystem
{
    TMap<int, FECSEntity> BreathAudioMap;

    UBreathAudioSubsystem()
    {
        return;
    }
    int PlayNextAudio(const FECSEntity &inout Entity, const TSoftObjectPtr<UAkAudioEvent> &inout NextBreathAudioEvent)
    {
        int local_3_2 = FGameAudioUtils::PlayEventOnEmitter(NextBreathAudioEvent, Entity, FGameAudioUtils::CreateWiseEndCallback(FOnWiseEndCallback(this, n"OnBreathAudioEnd")), EGameAudioEmitterPartType(0), true, false, false, FGameAudioUtils::GetCachedAudioWorld(), true);
        this.BreathAudioMap.Add(local_3_2, Entity);
        return local_3_2;
    }
    UFUNCTION()
    void OnBreathAudioEnd(const int SoundId)
    {
        FC_BreathAudio local_12;
        FECSEntity local_4;
        if (this.BreathAudioMap.RemoveAndCopyValue(SoundId, local_4) == false)
        {
            return;
        }
        if (local_12.NextBreathAudioEvent.IsNull())
        {
            return;
        }
        if (local_12.NextReactionAudioEvent.IsNull() == false)
        {
            local_12.CurrentAudioEvent = local_12.NextReactionAudioEvent;
            local_12.CurrentStopAudioEvent = local_12.NextReactionStopAudioEvent;
            local_12.CurrentSoundId = this.PlayNextAudio(local_4, local_12.NextReactionAudioEvent);
            local_12.NextReactionAudioEvent.Reset();
            local_12.NextReactionStopAudioEvent.Reset();
        }
        else
        {
            local_12.CurrentAudioEvent = local_12.NextBreathAudioEvent;
            local_12.CurrentStopAudioEvent = local_12.NextBreathStopAudioEvent;
            local_12.CurrentSoundId = this.PlayNextAudio(local_4, local_12.NextBreathAudioEvent);
        }
        return;
    }
}

namespace BreathAudioUtils
{
void PlayBreathSound(const FECSEntity &inout Entity, const TSoftObjectPtr<UAkAudioEvent> &inout BreathAudioEvent, const TSoftObjectPtr<UAkAudioEvent> &inout StopAudioEvent)
{
    FC_BreathAudio local_8;
    bool local_1 = !(!(BreathAudioEvent.IsNull()) == !(false));
    if (local_1)
    {
        return;
    }
    if (local_8.CurrentAudioEvent.IsNull())
    {
        local_8.CurrentAudioEvent = BreathAudioEvent;
        local_8.CurrentStopAudioEvent = StopAudioEvent;
        local_8.CurrentSoundId = UBreathAudioSubsystem::Get().PlayNextAudio(Entity, BreathAudioEvent);
    }
    local_8.NextBreathAudioEvent = BreathAudioEvent;
    local_8.NextBreathStopAudioEvent = StopAudioEvent;
    return;
}
void PlayCharacterReactionSound(const FECSEntity &inout Entity, const TSoftObjectPtr<UAkAudioEvent> &inout Event, const TSoftObjectPtr<UAkAudioEvent> &inout StopAudioEvent, const ECharacterReactionSoundType ReactionSoundType)
{
    bool local_1 = !(!(Event.IsNull()) == !(false));
    if (local_1)
    {
        return;
    }
    if (int(ReactionSoundType) == 0)
    {
        FC_BreathAudio local_8;
        if (int(local_8.CurrentSoundId) != INDEX_NONE)
        {
            UBreathAudioSubsystem::Get().BreathAudioMap.Remove(local_8.CurrentSoundId);
            if (!(local_8.CurrentStopAudioEvent.IsNull()) == !(false))
            {
                FGameAudioUtils::PlayEventOnEmitter(local_8.CurrentStopAudioEvent, Entity, FLoadEventCallback(), EGameAudioEmitterPartType(0), true, false, false, FGameAudioUtils::GetCachedAudioWorld(), true);
            }
            else
            {
                FGameAudioUtils::StopSound(int(local_8.CurrentSoundId));
            }
        }
        local_8.CurrentAudioEvent = Event;
        local_8.CurrentStopAudioEvent = StopAudioEvent;
        local_8.CurrentSoundId = UBreathAudioSubsystem::Get().PlayNextAudio(Entity, Event);
        local_8.NextReactionAudioEvent.Reset();
        return;
    }
    if (int(ReactionSoundType) == 1)
    {
        FC_BreathAudio local_8;
        local_8.NextReactionAudioEvent = Event;
        local_8.NextReactionStopAudioEvent = StopAudioEvent;
    }
    return;
}
}
