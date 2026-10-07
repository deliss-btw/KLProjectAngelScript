

class UAudioVoDebugTool : UKLConsoleCommandLibrary
{
    default Category = n"Dev";

    UAudioVoDebugTool()
    {
        return;
    }
    UFUNCTION()
    void TestExternalSource()
    {
        FAudioExternalSourceUtils::SetExternalSourceMediaByName("External_Source", "03.wem");
        FAkChannelMask local_1;
        FECSEntity local_34 = FGameUtils::GetLocalPlayerPawn(false);
        ::FAudioVoUtils::SendAudioVoEventOnlyPresentation(n"Monster_Common_Status_ZoneSwap", local_34, FFPTime(-1));
        return;
    }
    UFUNCTION()
    void TestPlayPiano()
    {
        FGameAudioUtils::GetAudioSoftObjectPathFromStateAssetName(n"StateGroup_Gameplay-None");
        FECSEntity local_28 = FGameUtils::GetLocalPlayerPawn(false);
        FGameAudioUtils::SetAudioSwitch(n"SwitchGroup_SocialPianoNote_MIDI-MIDI_50", local_28, FOnLoadEventCallbackWithEntity(), true, FGameAudioUtils::GetCachedAudioWorld());
        FGameAudioUtils::PlayEventAtLocation(n"Play_UI_SocialObj_Piano", local_28, FLoadEventCallback(), FVector::ZeroVector, FQuat4f::Identity, FGameAudioUtils::GetCachedAudioWorld(), true, true);
        return;
    }
}

