
namespace FVM_PlayPiano
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature StartPianoAudio = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature StartInstrumentAudio = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature StopPianoAudio = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature StopInstrumentAudio = FEUIModelCallbackSignature();

}
struct FVM_PlayPiano : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_TitleText;
    UPROPERTY()
    bool m_bIsPlaying;
    UPROPERTY()
    int m_CurrentKeyIndex;

    FVM_PlayPiano()
    {
        this.m_bIsPlaying = false;
        this.m_CurrentKeyIndex = -1;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_PlayPiano(const FVM_PlayPiano &inout Other)
    {
        this.m_bIsPlaying = false;
        this.m_CurrentKeyIndex = -1;
        this.m_TitleText = Other.m_TitleText;
        this.m_bIsPlaying = Other.m_bIsPlaying;
        this.m_CurrentKeyIndex = int(Other.m_CurrentKeyIndex);
        return;
    }
    FVM_PlayPiano opAssign(const FVM_PlayPiano &inout Other)
    {
        FVM_PlayPiano __r;
        this.m_TitleText = Other.m_TitleText;
        this.m_bIsPlaying = Other.m_bIsPlaying;
        this.m_CurrentKeyIndex = int(Other.m_CurrentKeyIndex);
        return __r;
    }
    void PostConstruct()
    {
        return;
    }
    void Tick()
    {
        return;
    }
    void StartPianoAudio(const int KeyIndex)
    {
        FECSEntity local_4 = FECSEntity(this.GetContext().GetLocalPlayerPawn());
        if (local_4.IsValid() == false)
        {
            XWarning(ELog(1), FString().Append("StartPianoAudio LocalPawn is invalid!"));
            return;
        }
        if (this.GetCurrentKeyIndex() != KeyIndex)
        {
            this.SetCurrentKeyIndex(KeyIndex);
            this.SetbIsPlaying(true);
        }
        UDataTable local_18 = ::FAsGameAudioUtils::GetInstrumentAudioTable();
        FName local_24 = ::FAsGameAudioUtils::GetPlayInstrumentsSwitchName(local_4, local_18, KeyIndex);
        FName local_22 = ::FAsGameAudioUtils::GetPlayInstrumentsEvent(local_4, local_18);
        if (!(local_24.IsNone()))
        {
            FGameAudioUtils::SetAudioSwitch(local_24, local_4, FOnLoadEventCallbackWithEntity(), true, FGameAudioUtils::GetCachedAudioWorld());
        }
        if (!(local_22.IsNone()))
        {
            FGameAudioUtils::PlayEventOnEmitter(local_22, local_4, FLoadEventCallback(), EGameAudioEmitterPartType(0), true, false, false, FGameAudioUtils::GetCachedAudioWorld(), true);
        }
        if (FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool())
        {
            XLog(ELog(1), FString().Append("StartPianoAudio Local Play Aduio, Sender: ").Append(local_4).Append(", EventName:").Append(local_22).Append(", SwitchName:").Append(local_24));
        }
        ::FAsGameAudioUtils::SendAudioEventAndSwitchInputToServer(local_4, local_22, local_24, false);
        return;
    }
    void StartInstrumentAudio(const int KeyIndex)
    {
        this.StartPianoAudio(KeyIndex);
        return;
    }
    void StopPianoAudio(const int KeyIndex)
    {
        FECSEntity local_4 = FECSEntity(this.GetContext().GetLocalPlayerPawn());
        if (local_4.IsValid() == false)
        {
            XWarning(ELog(1), FString().Append("StopPianoAudio LocalPawn is invalid!"));
            return;
        }
        UDataTable local_18 = ::FAsGameAudioUtils::GetInstrumentAudioTable();
        FName local_24 = ::FAsGameAudioUtils::GetStopInstrumentsSwitchName(local_4, local_18);
        FName local_22 = ::FAsGameAudioUtils::GetStopInstrumentsEvent(local_4, local_18);
        if (!(local_24.IsNone()))
        {
            FGameAudioUtils::SetAudioSwitch(local_24, local_4, FOnLoadEventCallbackWithEntity(), true, FGameAudioUtils::GetCachedAudioWorld());
        }
        if (!(local_22.IsNone()))
        {
            FGameAudioUtils::PlayEventOnEmitter(local_22, local_4, FLoadEventCallback(), EGameAudioEmitterPartType(0), true, false, false, FGameAudioUtils::GetCachedAudioWorld(), true);
        }
        if (FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool())
        {
            XLog(ELog(1), FString().Append("StopPianoAudio Local Stop Aduio, Sender: ").Append(local_4).Append(", EventName:").Append(local_22).Append(", SwitchName:").Append(local_24));
        }
        ::FAsGameAudioUtils::SendAudioEventAndSwitchInputToServer(local_4, local_22, local_24, true);
        this.SetbIsPlaying(false);
        this.SetCurrentKeyIndex(-1);
        return;
    }
    void StopInstrumentAudio(const int KeyIndex)
    {
        this.StopPianoAudio(KeyIndex);
        return;
    }
    FText GetTitleText() const property
    {
        FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_TitleText() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTitleText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TitleText = __Value;
        return;
    }
    bool GetbIsPlaying() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bIsPlaying;
    }
    void SetbIsPlaying(const bool __Value) property
    {
        if (!(this.m_bIsPlaying) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bIsPlaying = __Value;
        return;
    }
    int GetCurrentKeyIndex() const property
    {
        this.TrackPropertyRead(2);
        return this.m_CurrentKeyIndex;
    }
    void SetCurrentKeyIndex(const int __Value) property
    {
        if (this.m_CurrentKeyIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CurrentKeyIndex = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_PlayPiano
{
    UPROPERTY()
    TEUIModelRef<FVM_PlayPiano> Self;

    __GeneratedProperties_FVM_PlayPiano()
    {
        return;
    }
}

namespace FVM_PlayPiano
{
FVM_PlayPiano& Create(const UObject ContextObject)
{
    return FVM_PlayPiano::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_PlayPiano CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_PlayPiano __r;
    TEUIModelRef<FVM_PlayPiano> local_6 = TEUIModelRef<FVM_PlayPiano>(EUIInternal::MakeModelWithManager(Manager, FVM_PlayPiano::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TitleText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_PlayPiano>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_PlayPiano;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_PlayPiano;
}
void __Tick(FVM_PlayPiano &inout Model)
{
    Model.Tick();
    return;
}
FText __UIGetter_TitleText(const FVM_PlayPiano &inout Model)
{
    return Model.GetTitleText();
}
TEUIModelRef<FVM_PlayPiano> __UIGetter_Self(const FVM_PlayPiano &inout Model)
{
    return TEUIModelRef<FVM_PlayPiano>(Model);
}
int __IndexOf_TitleText()
{
    return 0;
}
int __IndexOf_bIsPlaying()
{
    return 1;
}
int __IndexOf_CurrentKeyIndex()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_PlayPiano
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
