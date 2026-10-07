
enum ELevelSequenceVisibilityMode
{
    None,
    HideAllEntities,
    HideExceptPlayer,
}

namespace FVM_SimpleLevelSequence
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature PlayToStopTime = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature PlayToEnd = FEUIModelCallbackSignature();

}
struct FVM_SimpleLevelSequence : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TSoftObjectPtr<ULevelSequence> m_LevelSequenceData;
    UPROPERTY()
    float32 m_StopTime;
    UPROPERTY()
    bool m_bAutoPlay;
    UPROPERTY()
    ELevelSequenceVisibilityMode m_VisibilityMode;
    UPROPERTY()
    ULevelSequencePlayer m_LevelSequencePlayer;
    UPROPERTY()
    ULevelSequence m_LevelSequence;
    UPROPERTY()
    bool m_bVisibilityOverrideActive;
    UPROPERTY()
    FECSEntity m_CachedTargetEntity;

    FVM_SimpleLevelSequence()
    {
        this.m_LevelSequencePlayer = nullptr;
        this.m_LevelSequence = nullptr;
        this.m_StopTime = 0.5f;
        this.m_bAutoPlay = false;
        this.m_VisibilityMode = ELevelSequenceVisibilityMode(0);
        this.m_bVisibilityOverrideActive = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_SimpleLevelSequence(const FVM_SimpleLevelSequence &inout Other)
    {
        this.m_LevelSequencePlayer = nullptr;
        this.m_LevelSequence = nullptr;
        this.m_StopTime = 0.5f;
        this.m_bAutoPlay = false;
        this.m_VisibilityMode = ELevelSequenceVisibilityMode(0);
        this.m_bVisibilityOverrideActive = false;
        this.m_LevelSequenceData = Other.m_LevelSequenceData;
        this.m_StopTime = Other.m_StopTime;
        this.m_bAutoPlay = Other.m_bAutoPlay;
        this.m_VisibilityMode = Other.m_VisibilityMode;
        this.m_LevelSequencePlayer = Other.m_LevelSequencePlayer;
        this.m_LevelSequence = Other.m_LevelSequence;
        this.m_bVisibilityOverrideActive = Other.m_bVisibilityOverrideActive;
        this.m_CachedTargetEntity = Other.m_CachedTargetEntity;
        return;
    }
    FVM_SimpleLevelSequence& opAssign(const FVM_SimpleLevelSequence &inout Other)
    {
        this.m_LevelSequenceData = Other.m_LevelSequenceData;
        this.m_StopTime = Other.m_StopTime;
        this.m_bAutoPlay = Other.m_bAutoPlay;
        this.m_VisibilityMode = Other.m_VisibilityMode;
        this.m_LevelSequencePlayer = Other.m_LevelSequencePlayer;
        this.m_LevelSequence = Other.m_LevelSequence;
        this.m_bVisibilityOverrideActive = Other.m_bVisibilityOverrideActive;
        return Other.m_CachedTargetEntity;
    }
    void LoadConfig(const FConfigVM_SimpleLevelSequence &inout InConfig)
    {
        this.SetStopTime(InConfig.StopTime);
        this.SetbAutoPlay(InConfig.bAutoPlay);
        this.SetVisibilityMode(InConfig.VisibilityMode);
        this.SetLevelSequenceData(InConfig.LevelSequenceData);
        return;
    }
    void PostLoad()
    {
        if (this.GetbAutoPlay())
        {
            this.PlayToStopTime();
        }
        return;
    }
    void BeginDestroy()
    {
        if (this.GetbAutoPlay())
        {
            this.PlayToEnd();
        }
        return;
    }
    void PlayToStopTime()
    {
        const AActor local_54;
        this.SetLevelSequence(Cast<ULevelSequence>(this.GetLevelSequenceData().ToSoftObjectPath().TryLoad()));
        if (this.GetLevelSequence() == nullptr)
        {
            return;
        }
        FMovieSceneSequencePlaybackSettings local_33;
        local_33.SetbAutoPlay(false);
        UObject local_20 = __GetWorldContext();
        ALevelSequenceActor local_36;
        this.SetLevelSequencePlayer(ULevelSequencePlayer::CreateLevelSequencePlayer(local_20, this.GetLevelSequence(), local_33, local_36));
        local_36.SetbOverrideInstanceData(true);
        local_36.CameraSettings.bOverrideAspectRatioAxisConstraint = false;
        UDefaultLevelSequenceInstanceData local_42 = (Cast<UDefaultLevelSequenceInstanceData>(local_36.DefaultInstanceData));
        if (local_42 != nullptr)
        {
            local_42.TransformOriginActor = local_36;
        }
        FEUIWidgetRef local_44 = this.GetOwnerWidget();
        FVM_InteractTarget& local_50 = FEUIWidgetRef::GetViewModel(local_44).opCall(NAME_None);
        if (local_50)
        {
            this.SetCachedTargetEntity(local_50.GetTargetEntity());
            if (this.GetCachedTargetEntity())
            {
                local_54 = this.GetCachedTargetEntity().GetActor();
                if (local_54 != nullptr)
                {
                    local_36.SetActorLocationAndRotation(local_54.GetActorLocation(), local_54.GetActorRotation(), false);
                }
            }
        }
        FMovieSceneSequencePlaybackParams local_82;
        FMovieSceneSequencePlayToParams local_83;
        int local_85 = int(this.GetStopTime());
        if ((int(this.GetVisibilityMode())) != 0)
        {
            this.SetbVisibilityOverrideActive(true);
        }
        this.GetLevelSequencePlayer().PlayTo(local_82, local_83);
        return;
    }
    void PlayToEnd()
    {
        if (this.GetbVisibilityOverrideActive())
        {
            this.SetbVisibilityOverrideActive(false);
        }
        if (this.GetLevelSequencePlayer() != nullptr)
        {
            if (this.GetLevelSequencePlayer().IsPlaying())
            {
                this.GetLevelSequencePlayer().Pause();
                int local_22 = int(this.GetStopTime());
                FMovieSceneSequencePlaybackParams local_20;
                this.GetLevelSequencePlayer().SetPlaybackPosition(local_20);
            }
            this.GetLevelSequencePlayer().Play();
        }
        return;
    }
    TSoftObjectPtr<ULevelSequence> GetLevelSequenceData() const property
    {
        this.TrackPropertyRead(0);
        return this.m_LevelSequenceData;
    }
    void SetLevelSequenceData(const TSoftObjectPtr<ULevelSequence> &inout __Value) property
    {
        if ((this.m_LevelSequenceData == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_LevelSequenceData = __Value;
        return;
    }
    const float32 GetStopTime() const property
    {
        const float32 __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    float32 GetModify_StopTime() property
    {
        float32 __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetStopTime(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_StopTime = __Value;
        return;
    }
    bool GetbAutoPlay() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bAutoPlay;
    }
    void SetbAutoPlay(const bool __Value) property
    {
        if (!(this.m_bAutoPlay) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bAutoPlay = __Value;
        return;
    }
    ELevelSequenceVisibilityMode GetVisibilityMode() const property
    {
        this.TrackPropertyRead(3);
        return this.m_VisibilityMode;
    }
    void SetVisibilityMode(const ELevelSequenceVisibilityMode __Value) property
    {
        if (int(this.m_VisibilityMode) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_VisibilityMode = __Value;
        return;
    }
    ULevelSequencePlayer GetLevelSequencePlayer() const property
    {
        this.TrackPropertyRead(4);
        return this.m_LevelSequencePlayer;
    }
    void SetLevelSequencePlayer(const ULevelSequencePlayer __Value) property
    {
        if (this.m_LevelSequencePlayer == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        return;
    }
    ULevelSequence GetLevelSequence() const property
    {
        this.TrackPropertyRead(5);
        return this.m_LevelSequence;
    }
    void SetLevelSequence(const ULevelSequence __Value) property
    {
        if (this.m_LevelSequence == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        return;
    }
    bool GetbVisibilityOverrideActive() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bVisibilityOverrideActive;
    }
    void SetbVisibilityOverrideActive(const bool __Value) property
    {
        if (!(this.m_bVisibilityOverrideActive) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bVisibilityOverrideActive = __Value;
        return;
    }
    const FECSEntity GetCachedTargetEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FECSEntity GetModify_CachedTargetEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetCachedTargetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_CachedTargetEntity = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_SimpleLevelSequence
{
    UPROPERTY()
    TEUIModelRef<FVM_SimpleLevelSequence> Self;

    __GeneratedProperties_FVM_SimpleLevelSequence()
    {
        return;
    }
}

namespace FVM_SimpleLevelSequence
{
FVM_SimpleLevelSequence& Create(const UObject ContextObject)
{
    return FVM_SimpleLevelSequence::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_SimpleLevelSequence CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_SimpleLevelSequence __r;
    TEUIModelRef<FVM_SimpleLevelSequence> local_6 = TEUIModelRef<FVM_SimpleLevelSequence>(EUIInternal::MakeModelWithManager(Manager, FVM_SimpleLevelSequence::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostLoad(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_SimpleLevelSequence>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_SimpleLevelSequence;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_SimpleLevelSequence;
}
TEUIModelRef<FVM_SimpleLevelSequence> __UIGetter_Self(const FVM_SimpleLevelSequence &inout Model)
{
    return TEUIModelRef<FVM_SimpleLevelSequence>(Model);
}
int __IndexOf_LevelSequenceData()
{
    return 0;
}
int __IndexOf_StopTime()
{
    return 1;
}
int __IndexOf_bAutoPlay()
{
    return 2;
}
int __IndexOf_VisibilityMode()
{
    return 3;
}
int __IndexOf_LevelSequencePlayer()
{
    return 4;
}
int __IndexOf_LevelSequence()
{
    return 5;
}
int __IndexOf_bVisibilityOverrideActive()
{
    return 6;
}
int __IndexOf_CachedTargetEntity()
{
    return 7;
}
}
namespace __GeneratedProperties_FVM_SimpleLevelSequence
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
