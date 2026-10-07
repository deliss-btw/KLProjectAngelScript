
namespace FVM_KeepShowcaseVisible
{
    const int ModelId = 0;
}
namespace FVM_AvatarShowcase
{
    const int ModelId = 0;

}
struct FMsg_ShowcaseActorsRefreshed : FEUIMessage
{
    FMsg_ShowcaseActorsRefreshed()
    {
        return;
    }
}

struct FVM_KeepShowcaseVisible : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    uint m_ShowcaseUniqueID;

    FVM_KeepShowcaseVisible()
    {
        this.m_ShowcaseUniqueID = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_KeepShowcaseVisible(const FVM_KeepShowcaseVisible &inout Other)
    {
        this.m_ShowcaseUniqueID = 0;
        this.m_ShowcaseUniqueID = int(Other.m_ShowcaseUniqueID);
        return;
    }
    FVM_KeepShowcaseVisible opAssign(const FVM_KeepShowcaseVisible &inout Other)
    {
        FVM_KeepShowcaseVisible __r;
        this.m_ShowcaseUniqueID = int(Other.m_ShowcaseUniqueID);
        return __r;
    }
    void PostConstruct()
    {
        UUIShowcaseManagerSubsystem local_4 = UUIShowcaseManagerSubsystem::Get();
        if (local_4 != nullptr)
        {
            this.SetShowcaseUniqueID(local_4.GetUniqueID());
            int local_6 = this.GetShowcaseUniqueID();
            XLog(ELog(52), FString().Append("  >>>> [FVM_KeepShowcaseVisible] KeepShowcase + 1 ").Append(local_6));
            local_4.KeepShowcase();
        }
        return;
    }
    void BeginDestroy()
    {
        UUIShowcaseManagerSubsystem local_4 = UUIShowcaseManagerSubsystem::Get();
        if (local_4 != nullptr)
        {
            if (local_4.GetUniqueID() != this.GetShowcaseUniqueID())
            {
                int local_6 = local_4.GetUniqueID();
                int local_7 = this.GetShowcaseUniqueID();
                XLog(ELog(52), FString().Append(" >>>> [FVM_KeepShowcaseVisible] KeepShowcase - 1, but UniqueID is not the same  ").Append(local_7).Append(" != ").Append(local_6));
                return;
            }
            local_4.ReleaseShowcaseKeep();
        }
        return;
    }
    uint GetShowcaseUniqueID() const property
    {
        this.TrackPropertyRead(0);
        return this.m_ShowcaseUniqueID;
    }
    void SetShowcaseUniqueID(const uint __Value) property
    {
        if (this.m_ShowcaseUniqueID == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ShowcaseUniqueID = __Value;
        return;
    }
}

struct FAvatarShowcaseEntry
{
    UPROPERTY()
    TDataObjectPtr<FAvatarPrefabConfig> AvatarConfig;
    UPROPERTY()
    TDataObjectPtr<FWeaponConfig> WeaponConfig;

    FAvatarShowcaseEntry()
    {
        return;
    }
}

struct FVM_AvatarShowcase : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<TDataObjectPtr<FUIShowcaseConfig>> m_Configs;
    UPROPERTY()
    TArray<TDataObjectPtr<FUIShowcaseConfig>> m_ExtraConfigs;
    UPROPERTY()
    int m_ShowcaseConfigIndex;
    UPROPERTY()
    uint m_ShowcaseUniqueID;
    UPROPERTY()
    TArray<TDataObjectPtr<FAvatarPrefabConfig>> m_Avatars;
    UPROPERTY()
    TArray<FAvatarShowcaseEntry> m_AvatarEntries;
    UPROPERTY()
    TDataObjectPtr<FMountFashionConfig> m_MountConfig;
    UPROPERTY()
    bool m_bShowcaseLoaded;

    FVM_AvatarShowcase()
    {
        this.m_ShowcaseUniqueID = 0;
        this.m_bShowcaseLoaded = false;
        this.m_ShowcaseConfigIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_AvatarShowcase(const FVM_AvatarShowcase &inout Other)
    {
        this.m_ShowcaseUniqueID = 0;
        this.m_bShowcaseLoaded = false;
        this.m_ShowcaseConfigIndex = 0;
        this.m_Configs = Other.m_Configs;
        this.m_ExtraConfigs = Other.m_ExtraConfigs;
        this.m_ShowcaseConfigIndex = int(Other.m_ShowcaseConfigIndex);
        this.m_ShowcaseUniqueID = int(Other.m_ShowcaseUniqueID);
        this.m_Avatars = Other.m_Avatars;
        this.m_AvatarEntries = Other.m_AvatarEntries;
        this.m_MountConfig = Other.m_MountConfig;
        this.m_bShowcaseLoaded = Other.m_bShowcaseLoaded;
        return;
    }
    FVM_AvatarShowcase opAssign(const FVM_AvatarShowcase &inout Other)
    {
        FVM_AvatarShowcase __r;
        this.m_Configs = Other.m_Configs;
        this.m_ExtraConfigs = Other.m_ExtraConfigs;
        this.m_ShowcaseConfigIndex = int(Other.m_ShowcaseConfigIndex);
        this.m_ShowcaseUniqueID = int(Other.m_ShowcaseUniqueID);
        this.m_Avatars = Other.m_Avatars;
        this.m_AvatarEntries = Other.m_AvatarEntries;
        this.m_MountConfig = Other.m_MountConfig;
        this.m_bShowcaseLoaded = Other.m_bShowcaseLoaded;
        return __r;
    }
    void LoadConfig(const FConfigVM_AvatarShowcase &inout InConfig)
    {
        this.SetConfigs(InConfig.Configs);
        return;
    }
    void SetNextAvatars(const TArray<TDataObjectPtr<FAvatarPrefabConfig>> &inout NextAvatarConfigs)
    {
        TArray<TDataObjectPtr<FAvatarPrefabConfig>> local_4;
        local_4 = this.GetAvatars();
        if ((!((local_4 == NextAvatarConfigs))))
        {
            this.SetAvatars(NextAvatarConfigs);
        }
        return;
    }
    void SetNextAvatarEntries(const TArray<FAvatarShowcaseEntry> &inout NextAvatarEntries)
    {
        TArray<FAvatarShowcaseEntry> local_4;
        local_4 = this.GetAvatarEntries();
        if ((!((local_4 == NextAvatarEntries))))
        {
            this.SetAvatarEntries(NextAvatarEntries);
        }
        return;
    }
    void SetNextMountConfig(const TDataObjectPtr<FMountFashionConfig> &inout NextMountConfig)
    {
        TDataObjectPtr<FMountFashionConfig> local_24;
        local_24 = this.GetMountConfig();
        if ((!((local_24 == NextMountConfig.opImplConv()))))
        {
            this.SetMountConfig(NextMountConfig);
        }
        return;
    }
    void ClearNextMountConfig()
    {
        TDataObjectPtr<FMountFashionConfig> local_24;
        this.SetNextMountConfig(local_24);
        return;
    }
    bool IsShowcaseLoaded() const
    {
        return this.GetbShowcaseLoaded();
    }
    TArray<FUIShowcaseActorSpawnParams> GetActorSpawnParams() const
    {
        return this.BuildSpawnParams();
    }
    TArray<uint> GetShowcaseAvatarDataIds() const
    {
        if (this.GetAvatarEntries().Num() > 0)
        {
            for (auto& local_22 : this.GetAvatarEntries())
            {
                if (local_22.AvatarConfig)
                {
                }
            }
        }
        else
        {
            for (auto& local_36 : this.GetAvatars())
            {
                if (local_36)
                {
                }
            }
        }
        return TArray<uint>();
    }
    void RefreshCurrentActorsWithParams(const TArray<FUIShowcaseActorSpawnParams> &inout Params)
    {
        if (!(this.GetbShowcaseLoaded()))
        {
            return;
        }
        UUIShowcaseManagerSubsystem local_6 = UUIShowcaseManagerSubsystem::Get();
        if (local_6 != nullptr)
        {
            local_6.RefreshCurrentActors(FEUIModelRef(this), Params);
        }
        return;
    }
    void ChangeShowcaseConfigIndex(const int InShowcaseConfigIndex)
    {
        if (this.GetShowcaseConfigIndex() == InShowcaseConfigIndex || !(this.IsShowcaseConfigIndexValid(InShowcaseConfigIndex)))
        {
            return;
        }
        this.SetShowcaseConfigIndex(InShowcaseConfigIndex);
        if (this.GetbShowcaseLoaded())
        {
            UUIShowcaseManagerSubsystem local_8 = UUIShowcaseManagerSubsystem::Get();
            if (local_8 != nullptr)
            {
                local_8.LoadShowcase(this.GetShowcaseConfigByIndex(this.GetShowcaseConfigIndex()).opImplConv(), FEUIModelRef(this), this.BuildSpawnParams());
            }
        }
        return;
    }
    void EnsureShowcaseConfigAndSwitch(const TDataObjectPtr<FUIShowcaseConfig> &inout TargetConfig)
    {
        if (!(TargetConfig))
        {
            return;
        }
        int local_3 = this.EnsureShowcaseConfigRegistered(TargetConfig);
        if (local_3 >= 0)
        {
            this.ChangeShowcaseConfigIndex(local_3);
        }
        return;
    }
    int EnsureShowcaseConfigRegistered(const TDataObjectPtr<FUIShowcaseConfig> &inout TargetConfig)
    {
        if (!(TargetConfig))
        {
            return -1;
        }
        int local_3 = 0;
        for (; local_3 < this.GetConfigs().Num(); ++local_3)
        {
            TDataObjectPtr<FUIShowcaseConfig> local_28;
            local_28 = this.GetConfigs()[local_3];
            if ((local_28 == TargetConfig.opImplConv()))
            {
                return local_3;
            }
        }
        int local_3_2 = 0;
        for (; local_3_2 < this.GetExtraConfigs().Num(); ++local_3_2)
        {
            TDataObjectPtr<FUIShowcaseConfig> local_52;
            local_52 = this.GetExtraConfigs()[local_3_2];
            if ((local_52 == TargetConfig.opImplConv()))
            {
                return (this.GetConfigs().Num() + local_3_2);
            }
        }
        this.GetModify_ExtraConfigs().Add(TargetConfig);
        return ((this.GetConfigs().Num() + this.GetExtraConfigs().Num()) - 1);
    }
    bool IsShowcaseConfigIndexValid(const int Index) const
    {
        if (this.GetConfigs().IsValidIndex(Index))
        {
            return true;
        }
        return this.GetExtraConfigs().IsValidIndex((Index - this.GetConfigs().Num()));
    }
    TDataObjectPtr<FUIShowcaseConfig> GetShowcaseConfigByIndex(const int Index) const
    {
        if (this.GetConfigs().IsValidIndex(Index))
        {
            return this.GetConfigs()[Index];
        }
        int local_28 = Index - this.GetConfigs().Num();
        if (this.GetExtraConfigs().IsValidIndex(local_28))
        {
            return this.GetExtraConfigs()[local_28];
        }
        return TDataObjectPtr<FUIShowcaseConfig>();
    }
    void PlayerHoverAvatarSeq(const int Index, const bool bIsHover)
    {
        UUIShowcaseManagerSubsystem::Get().PlayerHoverSeq(Index, bIsHover);
        return;
    }
    void PostLoad()
    {
        if (this.IsShowcaseConfigIndexValid(this.GetShowcaseConfigIndex()))
        {
            this.SetShowcaseUniqueID(UUIShowcaseManagerSubsystem::Get().GetUniqueID());
            XLog(ELog(0), FString().Append("[FVM_AvatarShowcase] PostLoad ShowcaseUniqueID: ").Append(this.GetShowcaseUniqueID()));
            UUIShowcaseManagerSubsystem::Get().LoadShowcase(this.GetShowcaseConfigByIndex(this.GetShowcaseConfigIndex()).opImplConv(), FEUIModelRef(this), this.BuildSpawnParams());
            this.SetbShowcaseLoaded(true);
            this.PublishShowcaseActorsRefreshed();
        }
        this.GetManager().SetLayerHidden(EEUILayoutLayer(3), true);
        return;
    }
    void BeginDestroy()
    {
        if (this.GetbShowcaseLoaded())
        {
            int local_2;
            this.SetbShowcaseLoaded(false);
            local_2 = UUIShowcaseManagerSubsystem::Get().GetUniqueID();
            if (local_2 != this.GetShowcaseUniqueID())
            {
                XLog(ELog(0), FString().Append("[FVM_AvatarShowcase] BeginDestroy ShowcaseUniqueID is not the same: ").Append(this.GetShowcaseUniqueID()).Append(" != ").Append(local_2));
            }
            else
            {
                UUIShowcaseManagerSubsystem::Get().UnLoadShowcase(FEUIModelRef(this));
            }
        }
        this.GetManager().SetLayerHidden(EEUILayoutLayer(3), false);
        return;
    }
    void OnFadeStart(const FMsg_OnWidgetFadeOutStart &inout StartFade)
    {
        if (StartFade.bRemovedFromLayout)
        {
            UUIShowcaseManagerSubsystem::Get().MoveDownShowcase(FEUIModelRef(this));
        }
        return;
    }
    void RequireActors()
    {
        UUIShowcaseManagerSubsystem local_4 = UUIShowcaseManagerSubsystem::Get();
        if (local_4 != nullptr)
        {
            local_4.RefreshActors(FEUIModelRef(this), this.BuildSpawnParams());
        }
        this.PublishShowcaseActorsRefreshed();
        return;
    }
    void OnAvatarFashionChanged(const FMsg_AvatarFashionChanged &inout Msg)
    {
        if (!(this.GetbShowcaseLoaded()) || !(this.ShouldRefreshForAvatarFashionChanged(Msg)))
        {
            return;
        }
        UUIShowcaseManagerSubsystem local_6 = UUIShowcaseManagerSubsystem::Get();
        if (local_6 != nullptr)
        {
            local_6.RefreshActors(FEUIModelRef(this), this.BuildSpawnParams());
        }
        this.PublishShowcaseActorsRefreshed();
        return;
    }
    void OnFashionMountChanged(const FMsg_FashionMountChanged &inout Msg)
    {
        if (!(this.GetbShowcaseLoaded()) || !(this.GetMountConfig()))
        {
            return;
        }
        UUIShowcaseManagerSubsystem local_6 = UUIShowcaseManagerSubsystem::Get();
        if (local_6 != nullptr)
        {
            local_6.RefreshActors(FEUIModelRef(this), this.BuildSpawnParams());
        }
        this.PublishShowcaseActorsRefreshed();
        return;
    }
    bool ShouldRefreshForAvatarFashionChanged(const FMsg_AvatarFashionChanged &inout Msg) const
    {
        if (Msg.AvatarIds.Num() == 0)
        {
            return true;
        }
        TArray<uint> local_12 = this.GetShowcaseAvatarDataIds();
        for (auto local_25 : Msg.AvatarIds)
        {
            if (local_12.Contains(local_25))
            {
                return true;
            }
        }
        return false;
    }
    TArray<FUIShowcaseActorSpawnParams> BuildSpawnParams() const
    {
        TArray<FUIShowcaseActorSpawnParams> local_4;
        float32 local_8 = 0.0f;
        bool local_6 = false;
        int local_5 = local_6;
        float32 local_7 = 1.0f;
        TDataObjectPtr<FUIShowcaseConfig> local_34 = this.GetShowcaseConfigByIndex(this.GetShowcaseConfigIndex());
        if (local_34)
        {
            local_7 = local_8;
            local_5 = local_6;
        }
        if (this.GetMountConfig())
        {
            this.AppendMountSpawnParam(local_4, this.GetMountConfig(), local_34, local_7);
            return local_4;
        }
        if (this.GetAvatarEntries().Num() > 0)
        {
            const FAvatarPrefabConfig& local_196;
            for (auto& local_74 : this.GetAvatarEntries())
            {
                if (local_74.AvatarConfig)
                {
                    FUIShowcaseActorSpawnParams local_134;
                    local_134.ActorClass = local_196.ShowcaseActor;
                    if (local_74.WeaponConfig)
                    {
                        UClass local_212;
                        const FWeaponConfig& local_200;
                        local_212 = Cast<UClass>(local_200.WeaponPrefab.ToSoftObjectPath().TryLoad());
                        TSubclassOf<AECSPrefab> local_214 = TSubclassOf<AECSPrefab>(local_212);
                        if (local_214.IsValid())
                        {
                            local_134.WeaponSocketName = local_200.WeaponShowCaseSocketName;
                            local_134.WeaponActorClass = local_214.GetDefaultObject().Actor;
                        }
                    }
                    local_134.LightActorClass = local_196.ShowcaseLightActor;
                    local_134.Offset = local_196.ShowcaseOffset;
                    local_134.SetAvatarType(this.GenderTypeToShowcaseType(local_196.GenderType));
                    local_134.bUseFaceAnim = (local_5 != 0);
                    this.ApplyFashionFromModel(local_134, local_196);
                    local_4.Add(local_134);
                }
            }
        }
        else
        {
            const FAvatarPrefabConfig& local_196;
            for (auto& local_234 : this.GetAvatars())
            {
                if (local_234)
                {
                    FUIShowcaseActorSpawnParams local_194;
                    local_194.ActorClass = local_196.ShowcaseActor;
                    local_194.LightActorClass = local_196.ShowcaseLightActor;
                    local_194.Offset = local_196.ShowcaseOffset;
                    local_194.SetAvatarType(this.GenderTypeToShowcaseType(local_196.GenderType));
                    local_194.bUseFaceAnim = (local_5 != 0);
                    this.ApplyFashionFromModel(local_194, local_196);
                    local_4.Add(local_194);
                }
            }
        }
        return local_4;
    }
    void AppendMountSpawnParam(TArray<FUIShowcaseActorSpawnParams> &inout Actors, const TDataObjectPtr<FMountFashionConfig> &inout InMountConfig, const TDataObjectPtr<FUIShowcaseConfig> &inout CurrentShowcaseConfig, const float32 RainDynamicControl) const
    {
        if (!(InMountConfig))
        {
            return;
        }
        TSoftClassPtr<AActor> local_12;
        if (local_12.IsNull())
        {
            if (unresolved.MountPrefab.IsNull())
            {
                return;
            }
            FSoftObjectPath local_20;
            TSubclassOf<ACharacterPrefab> local_26 = TSubclassOf<ACharacterPrefab>((Cast<UClass>(local_20.TryLoad())));
            if (!(local_26.IsValid()))
            {
                FString local_32 = FString();
                return;
            }
            ACharacterPrefab local_38 = local_26.GetDefaultObject();
            if (local_38 == nullptr || local_38.Actor.IsNull())
            {
                FString local_32_2 = FString();
                return;
            }
            local_12 = local_38.Actor;
        }
        FUIShowcaseActorSpawnParams local_100;
        local_100.ActorClass = local_12;
        local_100.LightActorClass = this.ResolveMountShowcaseLightActor(CurrentShowcaseConfig);
        local_100.DynamicRainControl = RainDynamicControl;
        local_100.bUseFaceAnim = false;
        Actors.Add(local_100);
        return;
    }
    TSoftClassPtr<AActor> ResolveMountShowcaseLightActor(const TDataObjectPtr<FUIShowcaseConfig> &inout CurrentShowcaseConfig) const
    {
        bool local_4 = false;
        TSoftClassPtr<AActor> __return;
        bool local_5 = CurrentShowcaseConfig && (0 != 0);
        if (!(local_5))
        {
            local_5 = false;
        }
        else
        {
            local_4 = !local_4;
            local_5 = local_4;
        }
        if (local_5)
        {
        }
        else
        {
            if (this.GetAvatarEntries().Num() > 0)
            {
                for (auto& local_20 : this.GetAvatarEntries())
                {
                    if (local_20.AvatarConfig)
                    {
                        return __return;
                    }
                }
            }
            for (auto& local_34 : this.GetAvatars())
            {
                if (local_34)
                {
                    return __return;
                }
            }
            __return = TSoftClassPtr<AActor>();
        }
        return __return;
    }
    void ApplyFashionFromModel(FUIShowcaseActorSpawnParams &inout Actor, const FAvatarPrefabConfig &inout AvatarConfig) const
    {
        FAvatarFashion local_22;
        UGameClientConnectionSubsystem local_4 = ::UGameClientConnectionSubsystem::Get();
        if (local_4 == nullptr || !(local_4.IsConnectedToGameServer()))
        {
            ::FShowcaseFashionUtil::TryApplyFashionToActor(this.GetContext(), Actor, AvatarConfig);
            return;
        }
        FMS_FashionModel& local_8 = ::FMS_FashionModel::Get(this.GetContext().Manager);
        if (AvatarConfig.bIsMainPlayer)
        {
            int local_9 = local_8.GetFacePresetID();
        }
        if (!(local_8.GetAvatarFashionMap().Find(AvatarConfig.DataId, local_22)))
        {
            return;
        }
        this.AppendFashionId(Actor.FashionIds, int(local_22.HairID));
        if (int(local_22.SuitID) > 0)
        {
            this.AppendFashionId(Actor.FashionIds, int(local_22.SuitID));
        }
        else
        {
            this.AppendFashionId(Actor.FashionIds, int(local_22.TopID));
            this.AppendFashionId(Actor.FashionIds, int(local_22.BottomID));
        }
        for (auto& local_38 : local_22.Decos)
        {
            this.AppendFashionId(Actor.FashionIds, int(local_38.FashionID));
        }
        return;
    }
    void AppendFashionId(TArray<int> &inout FashionIds, const uint FashionId) const
    {
        if (FashionId > 0)
        {
            FashionIds.Add(FashionId);
        }
        return;
    }
    EUIShowcaseAvatarType GenderTypeToShowcaseType(const EGenderType Gender) const
    {
        int local_1 = int(Gender);
        if (local_1 <= 1)
        {
            if (local_1 != 0)
            {
                if (local_1 != 1)
                {
                }
                else
                {
                    return EUIShowcaseAvatarType(1);
                }
            }
        }
        return EUIShowcaseAvatarType(0);
    }
    void PublishShowcaseActorsRefreshed()
    {
        FEUIModelRef local_6 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus).opCall(local_6);
        return;
    }
    const TArray<TDataObjectPtr<FUIShowcaseConfig>> GetConfigs() const property
    {
        const TArray<TDataObjectPtr<FUIShowcaseConfig>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<TDataObjectPtr<FUIShowcaseConfig>> GetModify_Configs() property
    {
        TArray<TDataObjectPtr<FUIShowcaseConfig>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetConfigs(const TArray<TDataObjectPtr<FUIShowcaseConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Configs = __Value;
        return;
    }
    const TArray<TDataObjectPtr<FUIShowcaseConfig>> GetExtraConfigs() const property
    {
        const TArray<TDataObjectPtr<FUIShowcaseConfig>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TDataObjectPtr<FUIShowcaseConfig>> GetModify_ExtraConfigs() property
    {
        TArray<TDataObjectPtr<FUIShowcaseConfig>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetExtraConfigs(const TArray<TDataObjectPtr<FUIShowcaseConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ExtraConfigs = __Value;
        return;
    }
    int GetShowcaseConfigIndex() const property
    {
        this.TrackPropertyRead(2);
        return this.m_ShowcaseConfigIndex;
    }
    void SetShowcaseConfigIndex(const int __Value) property
    {
        if (this.m_ShowcaseConfigIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ShowcaseConfigIndex = __Value;
        return;
    }
    uint GetShowcaseUniqueID() const property
    {
        this.TrackPropertyRead(3);
        return this.m_ShowcaseUniqueID;
    }
    void SetShowcaseUniqueID(const uint __Value) property
    {
        if (this.m_ShowcaseUniqueID == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_ShowcaseUniqueID = __Value;
        return;
    }
    const TArray<TDataObjectPtr<FAvatarPrefabConfig>> GetAvatars() const property
    {
        const TArray<TDataObjectPtr<FAvatarPrefabConfig>> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<TDataObjectPtr<FAvatarPrefabConfig>> GetModify_Avatars() property
    {
        TArray<TDataObjectPtr<FAvatarPrefabConfig>> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetAvatars(const TArray<TDataObjectPtr<FAvatarPrefabConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_Avatars = __Value;
        return;
    }
    const TArray<FAvatarShowcaseEntry> GetAvatarEntries() const property
    {
        const TArray<FAvatarShowcaseEntry> __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    TArray<FAvatarShowcaseEntry> GetModify_AvatarEntries() property
    {
        TArray<FAvatarShowcaseEntry> __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetAvatarEntries(const TArray<FAvatarShowcaseEntry> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_AvatarEntries = __Value;
        return;
    }
    const TDataObjectPtr<FMountFashionConfig> GetMountConfig() const property
    {
        const TDataObjectPtr<FMountFashionConfig> __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    TDataObjectPtr<FMountFashionConfig> GetModify_MountConfig() property
    {
        TDataObjectPtr<FMountFashionConfig> __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetMountConfig(const TDataObjectPtr<FMountFashionConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_MountConfig = __Value;
        return;
    }
    bool GetbShowcaseLoaded() const property
    {
        this.TrackPropertyRead(7);
        return this.m_bShowcaseLoaded;
    }
    void SetbShowcaseLoaded(const bool __Value) property
    {
        if (!(this.m_bShowcaseLoaded) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_bShowcaseLoaded = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_KeepShowcaseVisible
{
    UPROPERTY()
    TEUIModelRef<FVM_KeepShowcaseVisible> Self;

    __GeneratedProperties_FVM_KeepShowcaseVisible()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_AvatarShowcase
{
    UPROPERTY()
    TEUIModelRef<FVM_AvatarShowcase> Self;

    __GeneratedProperties_FVM_AvatarShowcase()
    {
        return;
    }
}

namespace FAvatarShowcaseEntryUtils
{
FAvatarShowcaseEntry FromAvatarInfo(const TEUIModelRef<FVM_AvatarInfo> &inout AvatarInfo)
{
    FAvatarShowcaseEntry local_48;
    FAvatarShowcaseEntry __r;
    if (!(AvatarInfo))
    {
    }
    else
    {
        local_48.AvatarConfig = GetAvatarConfig();
        if (AvatarInfo.opArrow().GetAvatarEquipment())
        {
            TEUIModelRef<FVM_AvatarEquipment> local_76 = AvatarInfo.opArrow().GetAvatarEquipment();
            TEUIModelRef<FVM_EquipmentInfo> local_80;
            local_80.GetEquipment();
            TEUIModelRef<FVM_EquipmentInfo> local_78;
            if (local_78)
            {
                TDataObjectPtr<FEquipmentConfig> local_104;
                local_104.GetEquipmentConfig();
                if (local_104)
                {
                    CastTo local_132;
                    TDataObjectPtr<FWeaponConfig> local_156 = local_132.opCall();
                    if (local_156)
                    {
                        local_48.WeaponConfig = local_156;
                    }
                }
            }
            else
            {
                if (local_48.AvatarConfig)
                {
                    local_48.WeaponConfig = GetDefaultWeapon();
                }
            }
        }
        else
        {
            if (local_48.AvatarConfig)
            {
                local_48.WeaponConfig = GetDefaultWeapon();
            }
        }
    }
    return __r;
}
}
namespace FShowcaseFashionUtil
{
bool TryApplyFashionToActor(const FEUIModelContext &inout InContext, FUIShowcaseActorSpawnParams &inout Actor, const FAvatarPrefabConfig &inout AvatarConfig)
{
    FC_ViewEntityAppearance local_30;
    if (!(FShowcaseFashionUtil::TryGetViewAppearanceForAvatar(InContext, int(AvatarConfig.DataId), local_30)))
    {
        return false;
    }
    FShowcaseFashionUtil::ApplyViewAppearanceToSpawnParams(Actor, local_30, AvatarConfig.bIsMainPlayer);
    return true;
}
bool TryGetViewAppearanceForAvatar(const FEUIModelContext &inout InContext, const uint AvatarDataId, FC_ViewEntityAppearance &inout OutAppearance)
{
    int local_90 = 0;
    FECSEntity local_4 = InContext.GetLocalPlayer();
    Get local_8;
    const FC_PlayerController& local_10 = local_8.opCall();
    if (local_10)
    {
        for (auto& local_26 : local_10.GetAllPlayerPawnEntities())
        {
            if (!(local_26.IsValid()))
            {
                continue;
            }
            if (!(GetAvatarConfig(local_26)) || (0 != AvatarDataId))
            {
                continue;
            }
            if (!(FShowcaseFashionUtil::GetViewEntityFromPawn(local_26).IsValid()))
            {
                continue;
            }
            if (!(local_90))
            {
                continue;
            }
            return true;
        }
    }
    return false;
}
FECSEntity GetViewEntityFromPawn(const FECSEntity &inout PawnEntity)
{
    int local_12 = 0;
    if (!(PawnEntity.IsValid()))
    {
        return FECSEntity();
    }
    if (!(local_12))
    {
        return FECSEntity();
    }
    return local_12.GetGameActorEntity();
}
void ApplyViewAppearanceToSpawnParams(FUIShowcaseActorSpawnParams &inout Actor, const FC_ViewEntityAppearance &inout ViewAppearance, const bool bIsMainPlayer)
{
    Actor.FashionIds.Empty(0);
    if ((bIsMainPlayer && (int(ViewAppearance.FacePresetId) > 0)))
    {
        int local_2 = int(ViewAppearance.FacePresetId);
    }
    Actor.bUseBathrobe = (ViewAppearance.FashionInfo.GetbUseBathrobe() != 0);
    for (auto local_19 : ViewAppearance.FashionInfo.GetFashionIds())
    {
        if (local_19 > 0)
        {
            Actor.FashionIds.Add(local_19);
        }
    }
    return;
}
}
namespace FVM_KeepShowcaseVisible
{
FVM_KeepShowcaseVisible& Create(const UObject ContextObject)
{
    return FVM_KeepShowcaseVisible::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_KeepShowcaseVisible CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_KeepShowcaseVisible __r;
    TEUIModelRef<FVM_KeepShowcaseVisible> local_6 = TEUIModelRef<FVM_KeepShowcaseVisible>(EUIInternal::MakeModelWithManager(Manager, FVM_KeepShowcaseVisible::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_KeepShowcaseVisible>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_KeepShowcaseVisible;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_KeepShowcaseVisible;
}
TEUIModelRef<FVM_KeepShowcaseVisible> __UIGetter_Self(const FVM_KeepShowcaseVisible &inout Model)
{
    return TEUIModelRef<FVM_KeepShowcaseVisible>(Model);
}
int __IndexOf_ShowcaseUniqueID()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_KeepShowcaseVisible
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_AvatarShowcase
{
FVM_AvatarShowcase& Create(const UObject ContextObject)
{
    return FVM_AvatarShowcase::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_AvatarShowcase CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_AvatarShowcase __r;
    TEUIModelRef<FVM_AvatarShowcase> local_6 = TEUIModelRef<FVM_AvatarShowcase>(EUIInternal::MakeModelWithManager(Manager, FVM_AvatarShowcase::ModelId));
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
    local_14.TypeName = "TEUIModelRef<FVM_AvatarShowcase>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarShowcase;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__OnFadeStart";
    local_26.MessageTypeName = "Msg_OnWidgetFadeOutStart";
    local_26.SourcePropertyModelRefs = FBitSet64(-1);
    Result.MessageHandleFunctions.Add(local_26);
    FEUIModelDirtyDefine local_38;
    local_38.FunctionName = "__RequireActors";
    local_38.DirtyFlags.Set(FVM_AvatarShowcase::__IndexOf_MountConfig());
    local_38.DirtyFlags.Set(FVM_AvatarShowcase::__IndexOf_Avatars());
    local_38.DirtyFlags.Set(FVM_AvatarShowcase::__IndexOf_AvatarEntries());
    Result.DirtyFunctions.Add(local_38);
    local_26.FunctionName = "__OnAvatarFashionChanged";
    local_26.MessageTypeName = "Msg_AvatarFashionChanged";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    local_26.FunctionName = "__OnFashionMountChanged";
    local_26.MessageTypeName = "Msg_FashionMountChanged";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarShowcase;
}
void __OnFadeStart(FVM_AvatarShowcase &inout Model, const FMsg_OnWidgetFadeOutStart &inout Message)
{
    Model.OnFadeStart(Message);
    return;
}
void __RequireActors(FVM_AvatarShowcase &inout Model)
{
    Model.RequireActors();
    return;
}
void __OnAvatarFashionChanged(FVM_AvatarShowcase &inout Model, const FMsg_AvatarFashionChanged &inout Message)
{
    Model.OnAvatarFashionChanged(Message);
    return;
}
void __OnFashionMountChanged(FVM_AvatarShowcase &inout Model, const FMsg_FashionMountChanged &inout Message)
{
    Model.OnFashionMountChanged(Message);
    return;
}
TEUIModelRef<FVM_AvatarShowcase> __UIGetter_Self(const FVM_AvatarShowcase &inout Model)
{
    return TEUIModelRef<FVM_AvatarShowcase>(Model);
}
int __IndexOf_Configs()
{
    return 0;
}
int __IndexOf_ExtraConfigs()
{
    return 1;
}
int __IndexOf_ShowcaseConfigIndex()
{
    return 2;
}
int __IndexOf_ShowcaseUniqueID()
{
    return 3;
}
int __IndexOf_Avatars()
{
    return 4;
}
int __IndexOf_AvatarEntries()
{
    return 5;
}
int __IndexOf_MountConfig()
{
    return 6;
}
int __IndexOf_bShowcaseLoaded()
{
    return 7;
}
}
namespace __GeneratedProperties_FVM_AvatarShowcase
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
