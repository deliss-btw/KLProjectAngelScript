enum EAvatarPanelMode
{
    PVX,
    PVP,
}

namespace FVM_PVX_PlayerMonitor
{
    const int ModelId = 0;
}
namespace FVM_PVX_MainAvatar
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnSelectIllustrateFilter = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnSelectAvatar = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnAvatarSelectConfirm = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnPlayerReadyChanged = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnPlayerAvatarChanged = FEUIModelCallbackSignature();

}
struct FVM_PVX_PlayerMonitor : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FECSEntity m_PlayerEntity;
    UPROPERTY()
    FPlayerMonitorReadyEvent m_OnReadyChanged;
    UPROPERTY()
    FPlayerMonitorAvatarEvent m_OnAvatarChanged;
    UPROPERTY()
    bool m_bIsSelf;

    FVM_PVX_PlayerMonitor()
    {
        this.m_PlayerEntity = ENTITY_NULL;
        this.m_bIsSelf = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_PVX_PlayerMonitor' by default constructor.");
        return;
    }
    FVM_PVX_PlayerMonitor(const FVM_PVX_PlayerMonitor &inout Other)
    {
        this.m_PlayerEntity = ENTITY_NULL;
        this.m_bIsSelf = false;
        this.m_PlayerEntity = Other.m_PlayerEntity;
        this.m_bIsSelf = Other.m_bIsSelf;
        return;
    }
    FVM_PVX_PlayerMonitor(const FECSEntity &inout InPlayerEntity, const FPlayerMonitorReadyEvent &inout InOnReadyChanged, const FPlayerMonitorAvatarEvent &inout InOnAvatarChanged)
    {
        this.m_PlayerEntity = ENTITY_NULL;
        this.m_bIsSelf = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetPlayerEntity(InPlayerEntity);
        this.SetOnReadyChanged(InOnReadyChanged);
        this.SetOnAvatarChanged(InOnAvatarChanged);
        return;
    }
    FVM_PVX_PlayerMonitor opAssign(const FVM_PVX_PlayerMonitor &inout Other)
    {
        FVM_PVX_PlayerMonitor __r;
        this.m_PlayerEntity = Other.m_PlayerEntity;
        this.m_bIsSelf = Other.m_bIsSelf;
        return __r;
    }
    void OnPlayerStatesChanged(const FC_PlayerStates &inout PlayerStates)
    {
        XLog(ELog(70), FString().Append("[FVM_PVX_PlayerMonitor]OnPlayerStatesChanged."));
        if (this.GetOnReadyChanged().IsBound())
        {
            this.GetOnReadyChanged().Broadcast(this.GetPlayerEntity(), this.GetbIsSelf(), PlayerStates.GetbReady());
        }
        return;
    }
    void OnPlayerInfoPVXChanged(const FC_PlayerInfoPVX &inout PlayerInfoPVX)
    {
        XLog(ELog(70), FString().Append("[FVM_PVX_PlayerMonitor]OnPlayerInfoPVXChanged."));
        if (this.GetOnAvatarChanged().IsBound())
        {
            this.GetOnAvatarChanged().Broadcast(this.GetPlayerEntity(), PlayerInfoPVX.GetPlayerAvatarID());
        }
        return;
    }
    void OnPVXRuntimeChanged(const FC_PVXPlayerRuntime &inout Runtime)
    {
        XLog(ELog(70), FString().Append("[FVM_PVX_PlayerMonitor]OnTeammatePVXRuntimeChanged."));
        if (this.GetOnAvatarChanged().IsBound())
        {
            this.GetOnAvatarChanged().Broadcast(this.GetPlayerEntity(), Runtime.GetPlayerAvatarID());
        }
        return;
    }
    FECSEntity GetPlayerEntity() const property
    {
        FECSEntity __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FECSEntity GetModify_PlayerEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetPlayerEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PlayerEntity = __Value;
        return;
    }
    const FPlayerMonitorReadyEvent GetOnReadyChanged() const property
    {
        const FPlayerMonitorReadyEvent __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FPlayerMonitorReadyEvent GetModify_OnReadyChanged() property
    {
        FPlayerMonitorReadyEvent __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetOnReadyChanged(const FPlayerMonitorReadyEvent &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        return;
    }
    const FPlayerMonitorAvatarEvent GetOnAvatarChanged() const property
    {
        const FPlayerMonitorAvatarEvent __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FPlayerMonitorAvatarEvent GetModify_OnAvatarChanged() property
    {
        FPlayerMonitorAvatarEvent __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetOnAvatarChanged(const FPlayerMonitorAvatarEvent &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        return;
    }
    bool GetbIsSelf() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bIsSelf;
    }
    void SetbIsSelf(const bool __Value) property
    {
        if (!(this.m_bIsSelf) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bIsSelf = __Value;
        return;
    }
}

struct FVM_PVX_MainAvatar : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_SelectedAvatarIndex;
    UPROPERTY()
    bool m_bReady;
    UPROPERTY()
    TArray<FEUIModelContainer> m_IllustrateTypes;
    UPROPERTY()
    EAvatarIllustrate m_FilterByIllustrate;
    UPROPERTY()
    TEUIModelRef<FVMS_PlayerOwnedAvatarInfo> m_PlayerOwnedAvatarInfo;
    UPROPERTY()
    bool m_bMonsterCampus;
    UPROPERTY()
    TArray<FEUIModelContainer> m_FilteredAvatars;
    UPROPERTY()
    FEUIModelContainer m_SelectedAvatar;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarDetailInfo> m_AvatarDetailInfo;
    UPROPERTY()
    uint m_ConfirmedAvatarId;
    UPROPERTY()
    bool m_bConfirmButtonEnabled;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarShowcase> m_Showcase;
    UPROPERTY()
    bool m_bStartCount;
    UPROPERTY()
    FMW_TimeProgress m_SelectCountdown;
    UPROPERTY()
    int m_SelectCountdownSeconds;
    UPROPERTY()
    uint m_LocalPlayerUid;
    UPROPERTY()
    TMap<uint, TDataObjectPtr<FAvatarPrefabConfig>> m_TeamPlayersAvatar;
    UPROPERTY()
    TArray<FEUIModelContainer> m_TeamMemberPrepareItems;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_PVX_PlayerMonitor>> m_TeamPlayerMonitors;
    UPROPERTY()
    TEUIModelRef<FM_SocialTeam> m_MyFakeTeam;
    UPROPERTY()
    bool m_bPrepareFinish;
    UPROPERTY()
    EAvatarPanelMode m_AvatarPanelMode;

    FVM_PVX_MainAvatar()
    {
        this.m_SelectCountdownSeconds = 0;
        this.m_SelectedAvatarIndex = INDEX_NONE;
        this.m_bReady = false;
        this.m_FilterByIllustrate = EAvatarIllustrate(3);
        this.m_bMonsterCampus = false;
        this.m_ConfirmedAvatarId = 0;
        this.m_bConfirmButtonEnabled = false;
        this.m_bStartCount = false;
        this.m_LocalPlayerUid = 0;
        this.m_bPrepareFinish = false;
        this.m_AvatarPanelMode = EAvatarPanelMode(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_PVX_MainAvatar(const FVM_PVX_MainAvatar &inout Other)
    {
        this.m_SelectCountdownSeconds = 0;
        this.m_SelectedAvatarIndex = INDEX_NONE;
        this.m_bReady = false;
        this.m_FilterByIllustrate = EAvatarIllustrate(3);
        this.m_bMonsterCampus = false;
        this.m_ConfirmedAvatarId = 0;
        this.m_bConfirmButtonEnabled = false;
        this.m_bStartCount = false;
        this.m_LocalPlayerUid = 0;
        this.m_bPrepareFinish = false;
        this.m_AvatarPanelMode = EAvatarPanelMode(0);
        this.m_SelectedAvatarIndex = int(Other.m_SelectedAvatarIndex);
        this.m_bReady = Other.m_bReady;
        this.m_IllustrateTypes = Other.m_IllustrateTypes;
        this.m_FilterByIllustrate = Other.m_FilterByIllustrate;
        this.m_PlayerOwnedAvatarInfo = Other.m_PlayerOwnedAvatarInfo;
        this.m_bMonsterCampus = Other.m_bMonsterCampus;
        this.m_FilteredAvatars = Other.m_FilteredAvatars;
        this.m_SelectedAvatar = Other.m_SelectedAvatar;
        this.m_AvatarDetailInfo = Other.m_AvatarDetailInfo;
        this.m_ConfirmedAvatarId = int(Other.m_ConfirmedAvatarId);
        this.m_bConfirmButtonEnabled = Other.m_bConfirmButtonEnabled;
        this.m_Showcase = Other.m_Showcase;
        this.m_bStartCount = Other.m_bStartCount;
        this.m_SelectCountdown = Other.m_SelectCountdown;
        this.m_SelectCountdownSeconds = int(Other.m_SelectCountdownSeconds);
        this.m_LocalPlayerUid = int(Other.m_LocalPlayerUid);
        this.m_TeamPlayersAvatar = Other.m_TeamPlayersAvatar;
        this.m_TeamMemberPrepareItems = Other.m_TeamMemberPrepareItems;
        this.m_TeamPlayerMonitors = Other.m_TeamPlayerMonitors;
        this.m_MyFakeTeam = Other.m_MyFakeTeam;
        this.m_bPrepareFinish = Other.m_bPrepareFinish;
        this.m_AvatarPanelMode = Other.m_AvatarPanelMode;
        return;
    }
    FVM_PVX_MainAvatar opAssign(const FVM_PVX_MainAvatar &inout Other)
    {
        FVM_PVX_MainAvatar __r;
        this.m_SelectedAvatarIndex = int(Other.m_SelectedAvatarIndex);
        this.m_bReady = Other.m_bReady;
        this.m_IllustrateTypes = Other.m_IllustrateTypes;
        this.m_FilterByIllustrate = Other.m_FilterByIllustrate;
        this.m_PlayerOwnedAvatarInfo = Other.m_PlayerOwnedAvatarInfo;
        this.m_bMonsterCampus = Other.m_bMonsterCampus;
        this.m_FilteredAvatars = Other.m_FilteredAvatars;
        this.m_SelectedAvatar = Other.m_SelectedAvatar;
        this.m_AvatarDetailInfo = Other.m_AvatarDetailInfo;
        this.m_ConfirmedAvatarId = int(Other.m_ConfirmedAvatarId);
        this.m_bConfirmButtonEnabled = Other.m_bConfirmButtonEnabled;
        this.m_Showcase = Other.m_Showcase;
        this.m_bStartCount = Other.m_bStartCount;
        this.m_SelectCountdown = Other.m_SelectCountdown;
        this.m_SelectCountdownSeconds = int(Other.m_SelectCountdownSeconds);
        this.m_LocalPlayerUid = int(Other.m_LocalPlayerUid);
        this.m_TeamPlayersAvatar = Other.m_TeamPlayersAvatar;
        this.m_TeamMemberPrepareItems = Other.m_TeamMemberPrepareItems;
        this.m_TeamPlayerMonitors = Other.m_TeamPlayerMonitors;
        this.m_MyFakeTeam = Other.m_MyFakeTeam;
        this.m_bPrepareFinish = Other.m_bPrepareFinish;
        this.m_AvatarPanelMode = Other.m_AvatarPanelMode;
        return __r;
    }
    bool IsPVXMode() const
    {
        return (int(this.GetAvatarPanelMode()) == 0);
    }
    bool IsPVPMode() const
    {
        return (int(this.GetAvatarPanelMode()) == 1);
    }
    void PostConstruct()
    {
        int local_12 = 0;
        Has local_4;
        if (local_4.opCall())
        {
            if ((int(local_12.GetGameModeType())) == 1)
            {
                this.SetAvatarPanelMode(EAvatarPanelMode(0));
            }
            else
            {
                if ((int(local_12.GetGameModeType())) == 2)
                {
                    this.SetAvatarPanelMode(EAvatarPanelMode(1));
                }
            }
        }
        this.SetLocalPlayerUid(::FMS_PlayerData::Get(this.GetContext().Manager).GetLocalPlayerData().Get().GetPlayerUid());
        this.SetPlayerOwnedAvatarInfo(TEUIModelRef<FVMS_PlayerOwnedAvatarInfo>(::FVMS_PlayerOwnedAvatarInfo::Get(this.GetManager())));
        this.ViewInit();
        return;
    }
    void ViewInit()
    {
        const UUtilitySettings local_2;
        const UAvatarBuildSettings local_36;
        GetGameplaySettings<UUtilitySettings> local_4;
        local_2 = local_4;
        FEUIModelContainer local_20;
        local_20.AddModel(FEUIModelRef(::FVM_Image::Create(this.GetManager(), local_2.CommonCategoryAllIcon)), false);
        FVM_CommonTabItem& local_28 = ::FVM_CommonTabItem::Create(this.GetManager());
        local_28.SetTitleText(NSLOCTEXT("PVX_MainAvatar", "IllustrateAll", "全部"));
        local_20.AddModel(FEUIModelRef(local_28), false);
        this.GetModify_IllustrateTypes().Add(local_20);
        GetGameplaySettings<UAvatarBuildSettings> local_38;
        local_36 = local_38;
        if (local_36 != nullptr)
        {
            int local_41 = 0;
            for (; local_41 < 3; )
            {
                FEUIModelContainer local_56;
                FAvatarIllustrateInfo local_192;
                if (local_36.AvatarIllustrateInfos.Find(EAvatarIllustrate(local_41), local_192))
                {
                    local_56.AddModel(FEUIModelRef(::FVM_Image::Create(this.GetManager(), local_192.Icon)), false);
                }
                else
                {
                    local_56.AddModel(FEUIModelRef(::FVM_Image::Create(this.GetManager(), local_2.CommonCategoryAllIcon)), false);
                }
                FVM_CommonTabItem& local_196 = ::FVM_CommonTabItem::Create(this.GetManager());
                local_196.SetTitleText(local_192.DisplayName);
                local_56.AddModel(FEUIModelRef(local_196), false);
                this.GetModify_IllustrateTypes().Add(local_56);
                ++local_41;
            }
        }
        this.SetAvatarDetailInfo(TEUIModelRef<FVM_AvatarDetailInfo>(::FVM_AvatarDetailInfo::Create(this.GetManager())));
        this.GetAvatarDetailInfo().Get().SetPanelGameMode(EGameModeType(1));
        return;
    }
    void RefreshSelectCountdownSeconds()
    {
        this.SetSelectCountdownSeconds(FMath::RoundToInt(this.GetSelectCountdown().GetRemainedTime().ToSeconds()));
        if (this.GetSelectCountdownSeconds() <= 0)
        {
            this.SetbStartCount(false);
        }
        return;
    }
    float32 GetPrepareCountdownPercentage() const
    {
        return this.GetSelectCountdown().GetRemainingRatio();
    }
    ESlateVisibility ShowTeamMemberList() const
    {
        int local_2;
        if (this.GetbMonsterCampus())
        {
            local_2 = 1;
        }
        else
        {
            local_2 = 4;
        }
        return ESlateVisibility(local_2);
    }
    ESlateVisibility ShowAlreadyConfirmedText() const
    {
        int local_2;
        if (this.GetbConfirmButtonEnabled())
        {
            local_2 = 1;
        }
        else
        {
            local_2 = 4;
        }
        return ESlateVisibility(local_2);
    }
    void SetCurrentShowcase(const TEUIModelRef<FVM_AvatarShowcase> &inout InShowcase)
    {
        XLog(ELog(70), FString().Append("[M_Mode][PVX]SetCurrentShowcase."));
        this.SetShowcase(InShowcase);
        this.RefreshShowcaseAvatars();
        return;
    }
    void OnSelectedAvatarIndexChanged()
    {
        XLog(ELog(70), FString().Append("[M_Mode][PVX]OnSelectedAvatarIndexChanged."));
        if (this.GetFilteredAvatars().IsValidIndex(this.GetSelectedAvatarIndex()))
        {
            this.SetSelectedAvatar(this.GetFilteredAvatars()[this.GetSelectedAvatarIndex()]);
            TEUIModelRef<FVM_AvatarInfo> local_12 = this.GetSelectedAvatarInfo();
            if (local_12.IsValid())
            {
                if (this.GetTeamPlayersAvatar().Find(this.GetLocalPlayerUid()))
                {
                    int local_13 = this.GetLocalPlayerUid();
                    this.GetModify_TeamPlayersAvatar()[local_13] = local_12.Get().GetAvatarConfig();
                }
                this.GetAvatarDetailInfo().Get().SetCurrentAvatar(local_12.Get().GetAvatar());
                this.GetAvatarDetailInfo().Get().TrySetShowAttributeOrSkill(true);
            }
            this.RefreshShowcaseAvatars();
            this.RefreshConfirmButtonEnabled();
        }
        return;
    }
    TEUIModelRef<FVM_AvatarInfo> GetSelectedAvatarInfo() const
    {
        return TEUIModelRef<FVM_AvatarInfo>(FEUIModelContainer::GetModel(this.GetSelectedAvatar()).opCall());
    }
    void RefreshShowcaseAvatars()
    {
        XLog(ELog(70), FString().Append("[M_Mode][PVX]RefreshShowcaseAvatars."));
        if (this.GetShowcase())
        {
            TArray<TDataObjectPtr<FAvatarPrefabConfig>> local_14;
            TEUIModelRef<FVM_AvatarInfo> local_18 = this.GetSelectedAvatarInfo();
            if (local_18.IsValid())
            {
                local_14.Add(local_18.Get().GetAvatarConfig());
            }
            if (!(local_14.IsEmpty()))
            {
                XLog(ELog(70), FString().Append("[M_Mode][PVX]RefreshShowcaseAvatars. SetAvatars."));
                this.GetShowcase().Get().SetNextAvatars(local_14);
            }
        }
        return;
    }
    void RefreshConfirmButtonEnabled()
    {
        TEUIModelRef<FVM_AvatarInfo> local_4 = this.GetSelectedAvatarInfo();
        if (!(local_4.IsValid()) || !(local_4.Get().GetAvatarConfig().IsSet()))
        {
            this.SetbConfirmButtonEnabled(false);
            return;
        }
        int local_8 = local_4.Get().GetAvatarConfig().Get().DataId;
        int local_7 = local_8;
        int local_8_2 = this.GetConfirmedAvatarId();
        this.SetbConfirmButtonEnabled(local_8_2 == 0 || (local_7 != this.GetConfirmedAvatarId()));
        return;
    }
    void OnSelectIllustrateFilter(const int IllustrateFilterItemIndex)
    {
        int local_2 = IllustrateFilterItemIndex - 1;
        if (local_2 == INDEX_NONE)
        {
            this.SetFilterByIllustrate(EAvatarIllustrate(3));
            return;
        }
        this.SetFilterByIllustrate(EAvatarIllustrate(local_2));
        return;
    }
    void OnSelectAvatar(const int AvatarIndex)
    {
        if (AvatarIndex != INDEX_NONE)
        {
            this.SetSelectedAvatarIndex(AvatarIndex);
        }
        return;
    }
    void RefreshFilteredAvatarList()
    {
        if (this.GetbMonsterCampus())
        {
            return;
        }
        if (!(this.GetPlayerOwnedAvatarInfo().IsValid()))
        {
            this.SetPlayerOwnedAvatarInfo(TEUIModelRef<FVMS_PlayerOwnedAvatarInfo>(::FVMS_PlayerOwnedAvatarInfo::Get(this.GetManager())));
        }
        this.GetModify_FilteredAvatars().Reset(0);
        for (auto& local_22 : this.GetPlayerOwnedAvatarInfo().Get().GetUnLockAvatarList())
        {
            FVM_AvatarInfo& local_24 = local_22.Get();
            if (local_24)
            {
                if (local_24.GetAvatarConfig() && (int(local_24.GetAvatarConfig().Get().AvatarIllustrate) == int(this.GetFilterByIllustrate()) || (int(this.GetFilterByIllustrate()) == 3)))
                {
                    FEUIModelContainer local_44;
                    local_44.AddModel(local_22.opImplConv(), false);
                    FVM_AvatarInfoExtend& local_48 = ::FVM_AvatarInfoExtend::Create(this.GetContext().Manager);
                    local_48.SetbShowDisplayState(false);
                    local_44.AddModel(FEUIModelRef(local_48), false);
                    this.GetModify_FilteredAvatars().Add(local_44);
                }
            }
        }
        if (this.GetFilteredAvatars().Num() > 0)
        {
            int local_7 = this.GetFilteredAvatars().IndexOfByKey(this.GetSelectedAvatar());
            this.SetSelectedAvatarIndex((local_7 == INDEX_NONE ? 0 : local_7));
        }
        return;
    }
    void OnAvatarSelectConfirm()
    {
        if (!(this.GetbConfirmButtonEnabled()))
        {
            return;
        }
        int local_3 = this.GetSelectedAvatarIdForSend();
        if (local_3 == 0)
        {
            return;
        }
        this.SendAvatarSelectEvent(local_3);
        return;
    }
    uint GetSelectedAvatarIdForSend() const
    {
        if (this.IsPVXMode() && this.GetbMonsterCampus())
        {
            return 0;
        }
        TEUIModelRef<FVM_AvatarInfo> local_8 = this.GetSelectedAvatarInfo();
        if (local_8.IsValid() && local_8.Get().GetAvatarConfig().IsSet())
        {
            return local_8.Get().GetAvatarConfig().Get().DataId;
        }
        return 0;
    }
    void OnPVXMatchDataChanged(const FCS_PVX_MatchData &inout MatchData)
    {
        if (!(this.IsPVXMode()))
        {
            return;
        }
        this.RefreshPlayerCompDisplayFromEntries(MatchData.GetPlayerEntries(), MatchData.GetSelectRoleEndTime(), MatchData.GetSelectRoleTotalTime());
        return;
    }
    void OnUniversalMatchDataChanged(const FCS_GameMode_MatchData &inout UniversalMatchData)
    {
        if (!(this.IsPVXMode()))
        {
            return;
        }
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        TMap<uint, FPVX_MatchPlayerEntry> local_26;
        if (::FGameModeDataBridge::GetPVXMatchPlayerEntries(local_4, local_26))
        {
            this.RefreshPlayerCompDisplayFromEntries(local_26, ::FGameModeDataBridge::GetPVXSelectRoleEndTime(local_4), ::FGameModeDataBridge::GetPVXSelectRoleTotalTime(local_4));
        }
        return;
    }
    void RefreshPlayerCompDisplayFromEntries(const TMap<uint, FPVX_MatchPlayerEntry> &inout PlayerEntries, const FFPTime &inout InSelectRoleEndTime, const FFPTime &inout InSelectRoleTotalTime)
    {
        int local_129;
        int local_148 = 0;
        XLog(ELog(70), FString().Append("[M_Mode][PVX]RefreshPlayerCompDisplay."));
        bool local_6 = !(this.GetbStartCount());
        this.SetbStartCount(true);
        this.GetModify_SelectCountdown().EndAtSmooth(InSelectRoleEndTime, InSelectRoleTotalTime);
        FPVX_MatchPlayerEntry local_14;
        if (PlayerEntries.Num() <= 0)
        {
            local_6 = false;
        }
        else
        {
            local_6 = PlayerEntries.Find(this.GetLocalPlayerUid(), local_14);
        }
        if (local_6)
        {
            XLog(ELog(70), FString().Append("[M_Mode][PVX]RefreshPlayerCompDisplay. self campus=[").Append(local_14.GetFaction()).Append("], teamId=[").Append(local_14.GetTeamId()).Append("]"));
            if (!(this.GetMyFakeTeam().IsValid()) || this.GetMyFakeTeam().Get().GetTeamCommonData().Members.IsEmpty())
            {
                this.SetMyFakeTeam(TEUIModelRef<FM_SocialTeam>(::FM_SocialTeam::Create(this.GetContext().Manager, local_14.GetTeamId())));
                this.GetModify_TeamPlayerMonitors().Empty(0);
                this.GetModify_TeamMemberPrepareItems().Empty(0);
                this.GetModify_TeamPlayersAvatar().Empty(0);
                if (int(local_14.GetFaction()) == 1)
                {
                    this.SetbMonsterCampus(false);
                    for (auto& local_42 : PlayerEntries)
                    {
                        if (local_14.GetTeamId() == local_42.GetValue().GetTeamId())
                        {
                            this.GetModify_TeamPlayersAvatar().Add(local_42.GetKey(), TDataObjectPtr<FAvatarPrefabConfig>());
                        }
                    }
                }
                else
                {
                    if (int(local_14.GetFaction()) == 6)
                    {
                        this.SetbMonsterCampus(true);
                        this.GetModify_TeamPlayersAvatar().Add(this.GetLocalPlayerUid(), TDataObjectPtr<FAvatarPrefabConfig>());
                    }
                    else
                    {
                    }
                }
                FPlayerMonitorReadyEvent local_88;
                local_88.Add(this, FVM_PVX_MainAvatar::OnPlayerReadyChanged);
                FPlayerMonitorAvatarEvent local_110;
                local_110.Add(this, FVM_PVX_MainAvatar::OnPlayerAvatarChanged);
                for (auto& local_128 : this.GetTeamPlayersAvatar())
                {
                    local_129 = local_128.GetKey();
                    TEUIModelRef<FM_Player> local_134 = ::FMS_PlayerData::Get(this.GetContext().Manager).GetCachedPlayerData(local_129);
                    if (local_134.IsValid())
                    {
                        TEUIModelRef<FVM_PVX_PlayerMonitor> local_136 = TEUIModelRef<FVM_PVX_PlayerMonitor>(::FVM_PVX_PlayerMonitor::Create(this.GetContext().Manager, local_134.Get().GetPlayerEntity(), local_88, local_110));
                        local_136.Get().SetbIsSelf((local_129 == this.GetLocalPlayerUid()));
                        this.GetModify_TeamPlayerMonitors().Add(local_136);
                        FEUIModelRef local_146 = FEUIModelRef(this.GetMyFakeTeam().Get());
                        FEUIModelWeakRef local_144 = FEUIModelWeakRef(local_146);
                        local_148.SetPlayer(local_134);
                        if (PlayerEntries.Contains(local_129))
                        {
                            local_148.SetMemberIndex(PlayerEntries[local_129].GetPlayerInTeamIndex());
                        }
                        this.GetMyFakeTeam().opArrow().GetModify_TeamCommonData().Members.Add(TEUIModelRef<FM_TeamMember>(local_148));
                        TEUIModelRef<FVM_TeammateInfo> local_152 = TEUIModelRef<FVM_TeammateInfo>(::FVM_TeammateInfo::Create(this.GetContext().Manager, (TEUIModelRef<FM_TeamMember>(local_148))));
                        FEUIModelContainer local_168;
                        local_146 = FEUIModelRef(::FVM_TeamMemberPrepareItem::Create(this.GetContext().Manager, local_152));
                        local_168.AddModel(local_146, false);
                        FVM_PlayerBasicItemExtend& local_170 = ::FVM_PlayerBasicItemExtend::Create(this.GetContext().Manager);
                        local_170.SetbShowLevelText(false);
                        local_146 = FEUIModelRef(local_170);
                        local_168.AddModel(local_146, false);
                        this.GetModify_TeamMemberPrepareItems().Add(local_168);
                    }
                }
            }
        }
        return;
    }
    void UpdateTeamPlayerAvatar(const FECSEntity &inout PlayerEntity, const uint PlayerAvatarID)
    {
        if (PlayerAvatarID > 0)
        {
            GetDataObjectByGSDataId<FAvatarPrefabConfig> local_50;
            TDataObjectPtr<FAvatarPrefabConfig> local_26 = local_50.opImplConv();
            int local_1 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(PlayerEntity);
            if (!(!(local_26.IsSet())) && this.GetTeamPlayersAvatar().Find(local_1))
            {
                this.GetModify_TeamPlayersAvatar()[local_1] = local_26;
            }
            TEUIModelRef<FM_Player> local_108 = ::FMS_PlayerData::Get(this.GetContext().Manager).GetCachedPlayerData(local_1);
            if (local_108.IsValid() && local_26.IsSet())
            {
                local_108.Get().GetModify_CurrentAvatarAttr().Set(EPlayerInfoTrust(3), local_26);
            }
        }
        return;
    }
    void RefreshTeamPlayerFromServer(const FECSEntity &inout PlayerEntity)
    {
        int local_13;
        bool local_24;
        if (!(PlayerEntity.IsValid()))
        {
            return;
        }
        int local_3 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(PlayerEntity);
        Has local_8;
        bool local_1 = local_8.opCall();
        if (local_1)
        {
            Get local_12;
            local_13 = local_12.opCall().GetPlayerAvatarID();
        }
        else
        {
            local_13 = 0;
        }
        this.UpdateTeamPlayerAvatar(PlayerEntity, local_13);
        Has local_18;
        bool local_1_2 = local_18.opCall();
        if (local_1_2)
        {
            Get local_22;
            local_24 = local_22.opCall().GetbReady();
        }
        else
        {
            local_24 = false;
        }
        this.UpdateTeamMemberReady(local_3, local_24);
        if (local_3 == this.GetLocalPlayerUid())
        {
            this.SetbReady(local_24);
            bool local_23 = local_24 && (local_13 > 0);
            int local_2 = local_23 ? local_13 : 0;
            this.SetConfirmedAvatarId(local_2);
            this.RefreshConfirmButtonEnabled();
        }
        return;
    }
    void UpdateTeamMemberReady(const uint Uid, const bool bIsReady)
    {
        int local_30 = 0;
        for (auto& local_16 : this.GetTeamMemberPrepareItems())
        {
            TEUIModelRef<FVM_TeamMemberPrepareItem> local_18 = TEUIModelRef<FVM_TeamMemberPrepareItem>(FEUIModelContainer::GetModel(local_16).opCall());
            if (local_18.IsValid() && local_18.Get().GetTeammateInfo().IsValid())
            {
                TEUIModelRef<FVM_TeammateInfo> local_26 = local_18.Get().GetTeammateInfo();
                if (local_30.GetTeamMember().IsValid() && local_30.GetTeamMember().Get().GetPlayer().IsValid() && (local_30.GetTeamMember().Get().GetPlayer().Get().GetPlayerUid() == Uid))
                {
                    local_18.Get().SetbReady(bIsReady);
                    break;
                }
            }
        }
        return;
    }
    void OnPlayerReadyChanged(const FECSEntity &inout PlayerEntity, const bool bSelf, const bool bIsReady)
    {
        this.RefreshTeamPlayerFromServer(PlayerEntity);
        return;
    }
    void OnPlayerAvatarChanged(const FECSEntity &inout PlayerEntity, const uint PlayerAvatarID)
    {
        this.RefreshTeamPlayerFromServer(PlayerEntity);
        return;
    }
    void OnPVXStartGameTrigger(const FCE_PVXStartGameEvent &inout Event)
    {
        if (!(this.IsPVXMode()))
        {
            return;
        }
        this.FinishPrepareAvatar();
        return;
    }
    void FinishPrepareAvatar()
    {
        XLog(ELog(70), FString().Append("[M_Mode][PVX]FinishPrepareAvatar."));
        this.SetbPrepareFinish(true);
        return;
    }
    void SendAvatarSelectEvent(const uint SelectedAvatarId)
    {
        if (SelectedAvatarId == 0)
        {
            return;
        }
        if (this.IsPVXMode())
        {
            this.SendPVXAvatarSelectEvent(SelectedAvatarId);
            return;
        }
        if (this.IsPVPMode())
        {
            this.SendPVPAvatarSelectEvent(SelectedAvatarId);
        }
        return;
    }
    void SendPVXAvatarSelectEvent(const uint SelectedAvatarId)
    {
        XLog(ELog(70), FString().Append("[M_Mode][PVX]SendAvatarSelectEvent. SelectedAvatarId=[").Append(SelectedAvatarId).Append("]"));
        FFPTime local_16 = FFPTime(-1);
        FECSEntity local_10 = this.GetContext().GetLocalPlayer();
        FCE_PlayerSelectInfoPVX local_20;
        local_20.PlayerAvatarID = SelectedAvatarId;
        local_20.bIsReady = true;
        return;
    }
    void SendPVPAvatarSelectEvent(const uint SelectedAvatarId)
    {
        XLog(ELog(70), FString().Append("[M_Mode][PVP]SendAvatarSelectEvent. SelectedAvatarId=[").Append(SelectedAvatarId).Append("]"));
        FFPTime local_16 = FFPTime(-1);
        FECSEntity local_10 = this.GetContext().GetLocalPlayer();
        FCE_ClientToServerChangeRole local_20;
        local_20.SlotIndex = 0;
        local_20.AvatarId = SelectedAvatarId;
        return;
    }
    int GetSelectedAvatarIndex() const property
    {
        this.TrackPropertyRead(0);
        return this.m_SelectedAvatarIndex;
    }
    void SetSelectedAvatarIndex(const int __Value) property
    {
        if (this.m_SelectedAvatarIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_SelectedAvatarIndex = __Value;
        return;
    }
    bool GetbReady() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bReady;
    }
    void SetbReady(const bool __Value) property
    {
        if (!(this.m_bReady) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bReady = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetIllustrateTypes() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_IllustrateTypes() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetIllustrateTypes(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_IllustrateTypes = __Value;
        return;
    }
    EAvatarIllustrate GetFilterByIllustrate() const property
    {
        this.TrackPropertyRead(3);
        return this.m_FilterByIllustrate;
    }
    void SetFilterByIllustrate(const EAvatarIllustrate __Value) property
    {
        if (int(this.m_FilterByIllustrate) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_FilterByIllustrate = __Value;
        return;
    }
    TEUIModelRef<FVMS_PlayerOwnedAvatarInfo> GetPlayerOwnedAvatarInfo() const property
    {
        this.TrackPropertyRead(4);
        return this.m_PlayerOwnedAvatarInfo;
    }
    void SetPlayerOwnedAvatarInfo(const TEUIModelRef<FVMS_PlayerOwnedAvatarInfo> &inout __Value) property
    {
        TEUIModelRef<FVMS_PlayerOwnedAvatarInfo> local_2;
        local_2 = this.m_PlayerOwnedAvatarInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_PlayerOwnedAvatarInfo = __Value;
        return;
    }
    bool GetbMonsterCampus() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bMonsterCampus;
    }
    void SetbMonsterCampus(const bool __Value) property
    {
        if (!(this.m_bMonsterCampus) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bMonsterCampus = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetFilteredAvatars() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_FilteredAvatars() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetFilteredAvatars(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_FilteredAvatars = __Value;
        return;
    }
    FEUIModelContainer GetSelectedAvatar() const property
    {
        FEUIModelContainer __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FEUIModelContainer GetModify_SelectedAvatar() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetSelectedAvatar(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_SelectedAvatar = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarDetailInfo> GetAvatarDetailInfo() const property
    {
        this.TrackPropertyRead(8);
        return this.m_AvatarDetailInfo;
    }
    void SetAvatarDetailInfo(const TEUIModelRef<FVM_AvatarDetailInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarDetailInfo> local_2;
        local_2 = this.m_AvatarDetailInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_AvatarDetailInfo = __Value;
        return;
    }
    uint GetConfirmedAvatarId() const property
    {
        this.TrackPropertyRead(9);
        return this.m_ConfirmedAvatarId;
    }
    void SetConfirmedAvatarId(const uint __Value) property
    {
        if (this.m_ConfirmedAvatarId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_ConfirmedAvatarId = __Value;
        return;
    }
    bool GetbConfirmButtonEnabled() const property
    {
        this.TrackPropertyRead(10);
        return this.m_bConfirmButtonEnabled;
    }
    void SetbConfirmButtonEnabled(const bool __Value) property
    {
        if (!(this.m_bConfirmButtonEnabled) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_bConfirmButtonEnabled = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarShowcase> GetShowcase() const property
    {
        this.TrackPropertyRead(11);
        return this.m_Showcase;
    }
    void SetShowcase(const TEUIModelRef<FVM_AvatarShowcase> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarShowcase> local_2;
        local_2 = this.m_Showcase;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_Showcase = __Value;
        return;
    }
    bool GetbStartCount() const property
    {
        this.TrackPropertyRead(12);
        return this.m_bStartCount;
    }
    void SetbStartCount(const bool __Value) property
    {
        if (!(this.m_bStartCount) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_bStartCount = __Value;
        return;
    }
    const FMW_TimeProgress GetSelectCountdown() const property
    {
        const FMW_TimeProgress __r;
        this.TrackPropertyRead(13);
        return __r;
    }
    FMW_TimeProgress GetModify_SelectCountdown() property
    {
        FMW_TimeProgress __r;
        this.MarkPropertyDirty(13);
        return __r;
    }
    void SetSelectCountdown(const FMW_TimeProgress &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_SelectCountdown = __Value;
        return;
    }
    int GetSelectCountdownSeconds() const property
    {
        this.TrackPropertyRead(14);
        return this.m_SelectCountdownSeconds;
    }
    void SetSelectCountdownSeconds(const int __Value) property
    {
        if (this.m_SelectCountdownSeconds == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_SelectCountdownSeconds = __Value;
        return;
    }
    uint GetLocalPlayerUid() const property
    {
        this.TrackPropertyRead(15);
        return this.m_LocalPlayerUid;
    }
    void SetLocalPlayerUid(const uint __Value) property
    {
        if (this.m_LocalPlayerUid == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_LocalPlayerUid = __Value;
        return;
    }
    const TMap<uint, TDataObjectPtr<FAvatarPrefabConfig>> GetTeamPlayersAvatar() const property
    {
        const TMap<uint, TDataObjectPtr<FAvatarPrefabConfig>> __r;
        this.TrackPropertyRead(16);
        return __r;
    }
    TMap<uint, TDataObjectPtr<FAvatarPrefabConfig>> GetModify_TeamPlayersAvatar() property
    {
        TMap<uint, TDataObjectPtr<FAvatarPrefabConfig>> __r;
        this.MarkPropertyDirty(16);
        return __r;
    }
    void SetTeamPlayersAvatar(const TMap<uint, TDataObjectPtr<FAvatarPrefabConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_TeamPlayersAvatar = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetTeamMemberPrepareItems() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(17);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_TeamMemberPrepareItems() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(17);
        return __r;
    }
    void SetTeamMemberPrepareItems(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_TeamMemberPrepareItems = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_PVX_PlayerMonitor>> GetTeamPlayerMonitors() const property
    {
        const TArray<TEUIModelRef<FVM_PVX_PlayerMonitor>> __r;
        this.TrackPropertyRead(18);
        return __r;
    }
    TArray<TEUIModelRef<FVM_PVX_PlayerMonitor>> GetModify_TeamPlayerMonitors() property
    {
        TArray<TEUIModelRef<FVM_PVX_PlayerMonitor>> __r;
        this.MarkPropertyDirty(18);
        return __r;
    }
    void SetTeamPlayerMonitors(const TArray<TEUIModelRef<FVM_PVX_PlayerMonitor>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(18);
        this.m_TeamPlayerMonitors = __Value;
        return;
    }
    TEUIModelRef<FM_SocialTeam> GetMyFakeTeam() const property
    {
        this.TrackPropertyRead(19);
        return this.m_MyFakeTeam;
    }
    void SetMyFakeTeam(const TEUIModelRef<FM_SocialTeam> &inout __Value) property
    {
        TEUIModelRef<FM_SocialTeam> local_2;
        local_2 = this.m_MyFakeTeam;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(19);
        this.m_MyFakeTeam = __Value;
        return;
    }
    bool GetbPrepareFinish() const property
    {
        this.TrackPropertyRead(20);
        return this.m_bPrepareFinish;
    }
    void SetbPrepareFinish(const bool __Value) property
    {
        if (!(this.m_bPrepareFinish) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(20);
        this.m_bPrepareFinish = __Value;
        return;
    }
    EAvatarPanelMode GetAvatarPanelMode() const property
    {
        this.TrackPropertyRead(21);
        return this.m_AvatarPanelMode;
    }
    void SetAvatarPanelMode(const EAvatarPanelMode __Value) property
    {
        if (int(this.m_AvatarPanelMode) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(21);
        this.m_AvatarPanelMode = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_PVX_PlayerMonitor
{
    UPROPERTY()
    TEUIModelRef<FVM_PVX_PlayerMonitor> Self;

    __GeneratedProperties_FVM_PVX_PlayerMonitor()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_PVX_MainAvatar
{
    UPROPERTY()
    float32 PrepareCountdownPercentage;
    UPROPERTY()
    ESlateVisibility ShowTeamMemberList;
    UPROPERTY()
    ESlateVisibility ShowAlreadyConfirmedText;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarInfo> SelectedAvatarInfo;
    UPROPERTY()
    TEUIModelRef<FVM_PVX_MainAvatar> Self;

}

namespace FVM_PVX_PlayerMonitor
{
FVM_PVX_PlayerMonitor& Create(const UObject ContextObject, const FECSEntity &inout PlayerEntity, const FPlayerMonitorReadyEvent &inout OnReadyChanged, const FPlayerMonitorAvatarEvent &inout OnAvatarChanged)
{
    return FVM_PVX_PlayerMonitor::CreateByManager(EUIInternal::GetContextManager(ContextObject), PlayerEntity, OnReadyChanged, OnAvatarChanged);
}
FVM_PVX_PlayerMonitor& CreateByManager(const UEUIManagerSubsystem Manager, const FECSEntity &inout PlayerEntity, const FPlayerMonitorReadyEvent &inout OnReadyChanged, const FPlayerMonitorAvatarEvent &inout OnAvatarChanged)
{
    return TEUIModelRef<FVM_PVX_PlayerMonitor>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_PVX_PlayerMonitor::ModelId, 0, PlayerEntity, OnReadyChanged, OnAvatarChanged)).Get();
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_PVX_PlayerMonitor>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_PVX_PlayerMonitor;
    FEUIModelMonitorDefine local_26;
    local_26.FunctionName = "__OnPlayerStatesChanged";
    local_26.MonitorTarget = EEUIModelMonitorTarget(1);
    local_26.ComponentType = FC_PlayerStates;
    local_26.MonitorPropertyName = FName("PlayerEntity");
    int local_30 = FVM_PVX_PlayerMonitor::__IndexOf_PlayerEntity();
    local_26.MonitorPropertyDirtyIndex = int8(local_30);
    Result.MonitorFunctions.Add(local_26);
    local_26.FunctionName = "__OnPlayerInfoPVXChanged";
    local_26.MonitorTarget = EEUIModelMonitorTarget(1);
    local_26.ComponentType = FC_PlayerInfoPVX;
    local_26.MonitorPropertyName = FName("PlayerEntity");
    int local_30_2 = FVM_PVX_PlayerMonitor::__IndexOf_PlayerEntity();
    local_26.MonitorPropertyDirtyIndex = int8(local_30_2);
    Result.MonitorFunctions.Add(local_26);
    local_26.FunctionName = "__OnPVXRuntimeChanged";
    local_26.MonitorTarget = EEUIModelMonitorTarget(1);
    local_26.ComponentType = FC_PVXPlayerRuntime;
    local_26.MonitorPropertyName = FName("PlayerEntity");
    int local_30_3 = FVM_PVX_PlayerMonitor::__IndexOf_PlayerEntity();
    local_26.MonitorPropertyDirtyIndex = int8(local_30_3);
    Result.MonitorFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_PVX_PlayerMonitor;
}
void __OnPlayerStatesChanged(FVM_PVX_PlayerMonitor &inout Model, const FECSEntity &inout Entity, const FC_PlayerStates &inout Component)
{
    Model.OnPlayerStatesChanged(Component);
    return;
}
void __OnPlayerInfoPVXChanged(FVM_PVX_PlayerMonitor &inout Model, const FECSEntity &inout Entity, const FC_PlayerInfoPVX &inout Component)
{
    Model.OnPlayerInfoPVXChanged(Component);
    return;
}
void __OnPVXRuntimeChanged(FVM_PVX_PlayerMonitor &inout Model, const FECSEntity &inout Entity, const FC_PVXPlayerRuntime &inout Component)
{
    Model.OnPVXRuntimeChanged(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    __MonitorPlayerStatesLifetime(ECSWorld, EECSRegType(0), false, false, FECSMonitorDetail::All(NAME_None, FName("EJG_OutputBackend::TickUIModel")));
    __MonitorPlayerStatesModification(ECSWorld, EECSRegType(0), false, FECSMonitorDetail::All(NAME_None, FName("EJG_OutputBackend::TickUIModel")));
    __MonitorPlayerInfoPVXLifetime(ECSWorld, EECSRegType(0), false, false, FECSMonitorDetail::All(NAME_None, FName("EJG_OutputBackend::TickUIModel")));
    __MonitorPlayerInfoPVXModification(ECSWorld, EECSRegType(0), false, FECSMonitorDetail::All(NAME_None, FName("EJG_OutputBackend::TickUIModel")));
    __MonitorPVXPlayerRuntimeLifetime(ECSWorld, EECSRegType(0), false, false, FECSMonitorDetail::All(NAME_None, FName("EJG_OutputBackend::TickUIModel")));
    __MonitorPVXPlayerRuntimeModification(ECSWorld, EECSRegType(0), false, FECSMonitorDetail::All(NAME_None, FName("EJG_OutputBackend::TickUIModel")));
    return;
}
TEUIModelRef<FVM_PVX_PlayerMonitor> __UIGetter_Self(const FVM_PVX_PlayerMonitor &inout Model)
{
    return TEUIModelRef<FVM_PVX_PlayerMonitor>(Model);
}
int __IndexOf_PlayerEntity()
{
    return 0;
}
int __IndexOf_OnReadyChanged()
{
    return 1;
}
int __IndexOf_OnAvatarChanged()
{
    return 2;
}
int __IndexOf_bIsSelf()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_PVX_PlayerMonitor
{
UScriptStruct StaticStruct()
{
    return __GeneratedProperties_FVM_PVX_PlayerMonitor.Get();
}
}
namespace FVM_PVX_MainAvatar
{
FVM_PVX_MainAvatar& Create(const UObject ContextObject)
{
    return FVM_PVX_MainAvatar::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_PVX_MainAvatar& CreateByManager(const UEUIManagerSubsystem Manager)
{
    return TEUIModelRef<FVM_PVX_MainAvatar>(EUIInternal::MakeModelWithManager(Manager, FVM_PVX_MainAvatar::ModelId)).Get();
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "IllustrateTypes";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bMonsterCampus";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FilteredAvatars";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedAvatar";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AvatarDetailInfo";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarDetailInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bConfirmButtonEnabled";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectCountdownSeconds";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TeamMemberPrepareItems";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PrepareCountdownPercentage";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowTeamMemberList";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowAlreadyConfirmedText";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedAvatarInfo";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_PVX_MainAvatar>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_PVX_MainAvatar;
    FEUIModelRefPropertyDirtyIndexer local_22 = FEUIModelRefPropertyDirtyIndexer(22);
    local_22.AddRefPropertyDirty(0, 0, FVMS_PlayerOwnedAvatarInfo::__IndexOf_UnLockAvatarList());
    local_22.ApplySort();
    FEUIModelRefPropertyDirty local_30;
    local_30.PropertyName = FName("PlayerOwnedAvatarInfo");
    local_30.PropertyModelId = FVMS_PlayerOwnedAvatarInfo::ModelId;
    local_30.MappingDirtyOffset = local_22.GetMappingDirtyOffset(0);
    local_30.RelatedDirtyMask.SetBit(FVMS_PlayerOwnedAvatarInfo::__IndexOf_UnLockAvatarList(), true);
    Result.ListeningModelRefDirties.Add(local_30);
    FEUIModelWatcherProperty local_35;
    local_35.PropertyName = FName("SelectCountdown");
    local_35.DirtyBitIndex = FVM_PVX_MainAvatar::__IndexOf_SelectCountdown();
    Result.WatcherProperties.Add(local_35);
    FEUIModelEffectDefine local_40;
    local_40.FunctionName = "RefreshSelectCountdownSeconds";
    Result.EffectFunctions.Add(local_40);
    FEUIModelDirtyDefine local_48;
    local_48.FunctionName = "__OnSelectedAvatarIndexChanged";
    local_48.DirtyFlags.Set(FVM_PVX_MainAvatar::__IndexOf_SelectedAvatarIndex());
    local_48.DirtyFlags.Set(FVM_PVX_MainAvatar::__IndexOf_FilteredAvatars());
    Result.DirtyFunctions.Add(local_48);
    local_48.FunctionName = "__RefreshFilteredAvatarList";
    local_48.DirtyFlags.Set(FVM_PVX_MainAvatar::__IndexOf_PlayerOwnedAvatarInfo());
    local_48.DirtyFlags.Set(local_22.GetMappingDirtyIndex(0));
    local_48.DirtyFlags.Set(FVM_PVX_MainAvatar::__IndexOf_FilterByIllustrate());
    Result.DirtyFunctions.Add(local_48);
    FEUIModelMonitorDefine local_58;
    local_58.FunctionName = "__OnPVXMatchDataChanged";
    local_58.MonitorTarget = EEUIModelMonitorTarget(2);
    local_58.ComponentType = FCS_PVX_MatchData;
    Result.MonitorFunctions.Add(local_58);
    local_58.FunctionName = "__OnUniversalMatchDataChanged";
    local_58.MonitorTarget = EEUIModelMonitorTarget(2);
    local_58.ComponentType = FCS_GameMode_MatchData;
    Result.MonitorFunctions.Add(local_58);
    FEUIModelEventDefine local_66;
    local_66.FunctionName = "__OnPVXStartGameTrigger";
    local_66.EventType = FCE_PVXStartGameEvent;
    Result.EventFunctions.Add(local_66);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_PVX_MainAvatar;
}
void __OnSelectedAvatarIndexChanged(FVM_PVX_MainAvatar &inout Model)
{
    Model.OnSelectedAvatarIndexChanged();
    return;
}
void __RefreshFilteredAvatarList(FVM_PVX_MainAvatar &inout Model)
{
    Model.RefreshFilteredAvatarList();
    return;
}
void __OnPVXMatchDataChanged(FVM_PVX_MainAvatar &inout Model, const FECSEntity &inout Entity, const FCS_PVX_MatchData &inout Component)
{
    Get local_4;
    Model.OnPVXMatchDataChanged(local_4.opCall());
    return;
}
void __OnUniversalMatchDataChanged(FVM_PVX_MainAvatar &inout Model, const FECSEntity &inout Entity, const FCS_GameMode_MatchData &inout Component)
{
    Get local_4;
    Model.OnUniversalMatchDataChanged(local_4.opCall());
    return;
}
void __OnPVXStartGameTrigger(FVM_PVX_MainAvatar &inout Model, const FCE_PVXStartGameEvent &inout Event)
{
    Model.OnPVXStartGameTrigger(Event);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    __MonitorPVX_MatchDataLifetime(ECSWorld, EECSRegType(0), false, false, FECSMonitorDetail::All(NAME_None, FName("EJG_OutputBackend::TickUIModel")));
    __MonitorPVX_MatchDataModification(ECSWorld, EECSRegType(0), false, FECSMonitorDetail::All(NAME_None, FName("EJG_OutputBackend::TickUIModel")));
    __MonitorGameMode_MatchDataLifetime(ECSWorld, EECSRegType(0), false, false, FECSMonitorDetail::All(NAME_None, FName("EJG_OutputBackend::TickUIModel")));
    __MonitorGameMode_MatchDataModification(ECSWorld, EECSRegType(0), false, FECSMonitorDetail::All(NAME_None, FName("EJG_OutputBackend::TickUIModel")));
    return;
}
TArray<FEUIModelContainer> __UIGetter_IllustrateTypes(const FVM_PVX_MainAvatar &inout Model)
{
    return Model.GetIllustrateTypes();
}
bool __UIGetter_bMonsterCampus(const FVM_PVX_MainAvatar &inout Model)
{
    return Model.GetbMonsterCampus();
}
TArray<FEUIModelContainer> __UIGetter_FilteredAvatars(const FVM_PVX_MainAvatar &inout Model)
{
    return Model.GetFilteredAvatars();
}
FEUIModelContainer __UIGetter_SelectedAvatar(const FVM_PVX_MainAvatar &inout Model)
{
    return Model.GetSelectedAvatar();
}
TEUIModelRef<FVM_AvatarDetailInfo> __UIGetter_AvatarDetailInfo(const FVM_PVX_MainAvatar &inout Model)
{
    return Model.GetAvatarDetailInfo();
}
bool __UIGetter_bConfirmButtonEnabled(const FVM_PVX_MainAvatar &inout Model)
{
    return Model.GetbConfirmButtonEnabled();
}
int __UIGetter_SelectCountdownSeconds(const FVM_PVX_MainAvatar &inout Model)
{
    return Model.GetSelectCountdownSeconds();
}
TArray<FEUIModelContainer> __UIGetter_TeamMemberPrepareItems(const FVM_PVX_MainAvatar &inout Model)
{
    return Model.GetTeamMemberPrepareItems();
}
float32 __UIGetter_PrepareCountdownPercentage(const FVM_PVX_MainAvatar &inout Model)
{
    return Model.GetPrepareCountdownPercentage();
}
ESlateVisibility __UIGetter_ShowTeamMemberList(const FVM_PVX_MainAvatar &inout Model)
{
    return Model.ShowTeamMemberList();
}
ESlateVisibility __UIGetter_ShowAlreadyConfirmedText(const FVM_PVX_MainAvatar &inout Model)
{
    return Model.ShowAlreadyConfirmedText();
}
TEUIModelRef<FVM_AvatarInfo> __UIGetter_SelectedAvatarInfo(const FVM_PVX_MainAvatar &inout Model)
{
    return Model.GetSelectedAvatarInfo();
}
TEUIModelRef<FVM_PVX_MainAvatar> __UIGetter_Self(const FVM_PVX_MainAvatar &inout Model)
{
    return TEUIModelRef<FVM_PVX_MainAvatar>(Model);
}
int __IndexOf_SelectedAvatarIndex()
{
    return 0;
}
int __IndexOf_bReady()
{
    return 1;
}
int __IndexOf_IllustrateTypes()
{
    return 2;
}
int __IndexOf_FilterByIllustrate()
{
    return 3;
}
int __IndexOf_PlayerOwnedAvatarInfo()
{
    return 4;
}
int __IndexOf_bMonsterCampus()
{
    return 5;
}
int __IndexOf_FilteredAvatars()
{
    return 6;
}
int __IndexOf_SelectedAvatar()
{
    return 7;
}
int __IndexOf_AvatarDetailInfo()
{
    return 8;
}
int __IndexOf_ConfirmedAvatarId()
{
    return 9;
}
int __IndexOf_bConfirmButtonEnabled()
{
    return 10;
}
int __IndexOf_Showcase()
{
    return 11;
}
int __IndexOf_bStartCount()
{
    return 12;
}
int __IndexOf_SelectCountdown()
{
    return 13;
}
int __IndexOf_SelectCountdownSeconds()
{
    return 14;
}
int __IndexOf_LocalPlayerUid()
{
    return 15;
}
int __IndexOf_TeamPlayersAvatar()
{
    return 16;
}
int __IndexOf_TeamMemberPrepareItems()
{
    return 17;
}
int __IndexOf_TeamPlayerMonitors()
{
    return 18;
}
int __IndexOf_MyFakeTeam()
{
    return 19;
}
int __IndexOf_bPrepareFinish()
{
    return 20;
}
int __IndexOf_AvatarPanelMode()
{
    return 21;
}
}
namespace __GeneratedProperties_FVM_PVX_MainAvatar
{
UScriptStruct StaticStruct()
{
    return __GeneratedProperties_FVM_PVX_MainAvatar.Get();
}
}
