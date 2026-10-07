
namespace FM_LocalPlayerLevel
{
    const int ModelId = 0;

}
struct FMsg_LocalPlayerLevelRefresh : FEUIMessage
{
    FMsg_LocalPlayerLevelRefresh()
    {
        return;
    }
}

struct FMsg_StigmataDataRefresh : FEUIMessage
{
    FMsg_StigmataDataRefresh()
    {
        return;
    }
}

struct FMsg_LocalPlayerChangeNameRsp : FEUIMessage
{
    UPROPERTY()
    int RetCode = 0;


}

struct FM_LocalPlayerLevel : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    uint m_LocalPlayerUidFromGS;
    UPROPERTY()
    int m_Level;
    UPROPERTY()
    int m_CurrentExp;
    UPROPERTY()
    bool m_bIsExpOverflow;
    UPROPERTY()
    int m_LevelBreakthroughStatus;
    UPROPERTY()
    int m_ServerLevelCap;
    UPROPERTY()
    int64 m_NextLevelCapUnlockTime;
    UPROPERTY()
    bool m_bIsLevelInit;
    UPROPERTY()
    int m_DisplayLevelUpFromLevel;
    UPROPERTY()
    int m_DisplayLevelUpToLevel;
    UPROPERTY()
    int m_DisplayLevelUpFromExp;
    UPROPERTY()
    int m_DisplayLevelUpToExp;
    UPROPERTY()
    bool m_bDisplayIsOverflow;
    UPROPERTY()
    bool m_bDisplayIsBreakthroughLevel;
    UPROPERTY()
    bool m_bIsDisplayLevelUpPopup;
    UPROPERTY()
    TSet<int> m_UnlockedStigmataIds;
    UPROPERTY()
    TSet<int> m_PrevUnlockedStigmataIds;
    UPROPERTY()
    TEUIModelRef<FVMS_PlayerLevelInfo> m_PlayerLevelInfoRef;
    UPROPERTY()
    TSet<int> m_MetBreakthroughCondIds;

    FM_LocalPlayerLevel()
    {
        this.m_LocalPlayerUidFromGS = 0;
        this.m_Level = 0;
        this.m_CurrentExp = 0;
        this.m_LevelBreakthroughStatus = 0;
        this.m_bIsExpOverflow = false;
        this.m_ServerLevelCap = 0;
        this.m_NextLevelCapUnlockTime = 0;
        this.m_bIsLevelInit = false;
        this.m_DisplayLevelUpFromLevel = 0;
        this.m_DisplayLevelUpToLevel = 0;
        this.m_DisplayLevelUpFromExp = 0;
        this.m_DisplayLevelUpToExp = 0;
        this.m_bDisplayIsOverflow = false;
        this.m_bDisplayIsBreakthroughLevel = false;
        this.m_bIsDisplayLevelUpPopup = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FM_LocalPlayerLevel(const FM_LocalPlayerLevel &inout Other)
    {
        this.m_LocalPlayerUidFromGS = 0;
        this.m_Level = 0;
        this.m_CurrentExp = 0;
        this.m_LevelBreakthroughStatus = 0;
        this.m_bIsExpOverflow = false;
        this.m_ServerLevelCap = 0;
        this.m_NextLevelCapUnlockTime = 0;
        this.m_bIsLevelInit = false;
        this.m_DisplayLevelUpFromLevel = 0;
        this.m_DisplayLevelUpToLevel = 0;
        this.m_DisplayLevelUpFromExp = 0;
        this.m_DisplayLevelUpToExp = 0;
        this.m_bDisplayIsOverflow = false;
        this.m_bDisplayIsBreakthroughLevel = false;
        this.m_bIsDisplayLevelUpPopup = false;
        this.m_LocalPlayerUidFromGS = int(Other.m_LocalPlayerUidFromGS);
        this.m_Level = int(Other.m_Level);
        this.m_CurrentExp = int(Other.m_CurrentExp);
        this.m_bIsExpOverflow = Other.m_bIsExpOverflow;
        this.m_LevelBreakthroughStatus = int(Other.m_LevelBreakthroughStatus);
        this.m_ServerLevelCap = int(Other.m_ServerLevelCap);
        this.m_NextLevelCapUnlockTime = Other.m_NextLevelCapUnlockTime;
        this.m_bIsLevelInit = Other.m_bIsLevelInit;
        this.m_DisplayLevelUpFromLevel = int(Other.m_DisplayLevelUpFromLevel);
        this.m_DisplayLevelUpToLevel = int(Other.m_DisplayLevelUpToLevel);
        this.m_DisplayLevelUpFromExp = int(Other.m_DisplayLevelUpFromExp);
        this.m_DisplayLevelUpToExp = int(Other.m_DisplayLevelUpToExp);
        this.m_bDisplayIsOverflow = Other.m_bDisplayIsOverflow;
        this.m_bDisplayIsBreakthroughLevel = Other.m_bDisplayIsBreakthroughLevel;
        this.m_bIsDisplayLevelUpPopup = Other.m_bIsDisplayLevelUpPopup;
        this.m_UnlockedStigmataIds = Other.m_UnlockedStigmataIds;
        this.m_PrevUnlockedStigmataIds = Other.m_PrevUnlockedStigmataIds;
        this.m_PlayerLevelInfoRef = Other.m_PlayerLevelInfoRef;
        this.m_MetBreakthroughCondIds = Other.m_MetBreakthroughCondIds;
        return;
    }
    FM_LocalPlayerLevel& opAssign(const FM_LocalPlayerLevel &inout Other)
    {
        this.m_LocalPlayerUidFromGS = int(Other.m_LocalPlayerUidFromGS);
        this.m_Level = int(Other.m_Level);
        this.m_CurrentExp = int(Other.m_CurrentExp);
        this.m_bIsExpOverflow = Other.m_bIsExpOverflow;
        this.m_LevelBreakthroughStatus = int(Other.m_LevelBreakthroughStatus);
        this.m_ServerLevelCap = int(Other.m_ServerLevelCap);
        this.m_NextLevelCapUnlockTime = Other.m_NextLevelCapUnlockTime;
        this.m_bIsLevelInit = Other.m_bIsLevelInit;
        this.m_DisplayLevelUpFromLevel = int(Other.m_DisplayLevelUpFromLevel);
        this.m_DisplayLevelUpToLevel = int(Other.m_DisplayLevelUpToLevel);
        this.m_DisplayLevelUpFromExp = int(Other.m_DisplayLevelUpFromExp);
        this.m_DisplayLevelUpToExp = int(Other.m_DisplayLevelUpToExp);
        this.m_bDisplayIsOverflow = Other.m_bDisplayIsOverflow;
        this.m_bDisplayIsBreakthroughLevel = Other.m_bDisplayIsBreakthroughLevel;
        this.m_bIsDisplayLevelUpPopup = Other.m_bIsDisplayLevelUpPopup;
        this.m_UnlockedStigmataIds = Other.m_UnlockedStigmataIds;
        this.m_PrevUnlockedStigmataIds = Other.m_PrevUnlockedStigmataIds;
        this.m_PlayerLevelInfoRef = Other.m_PlayerLevelInfoRef;
        return Other.m_MetBreakthroughCondIds;
    }
    uint GetLocalPlayerUid() const
    {
        return this.GetLocalPlayerUidFromGS();
    }
    int GetCurrentBreakthroughLevel() const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    int GetNextBreakthroughLevel() const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    int GetNextBreakthroughLevelAfter(const int InLevel) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    bool IsBreakthroughLevel(const int InLevel) const
    {
        const UPlayerInfoSettings local_2;
        GetGameplaySettings<UPlayerInfoSettings> local_4;
        local_2 = local_4;
        return local_2.GetBreakthroughLevels().Contains(InLevel);
    }
    bool IsStigmataUnlocked(const int DataId) const
    {
        return this.GetUnlockedStigmataIds().Contains(DataId);
    }
    bool IsBreakthroughCondMet(const int ConditionId) const
    {
        return this.GetMetBreakthroughCondIds().Contains(ConditionId);
    }
    int GetUpgradeExp() const
    {
        const UPlayerInfoSettings local_2;
        GetGameplaySettings<UPlayerInfoSettings> local_4;
        local_2 = local_4;
        TDataObjectPtr<FPlayerLevelConfig> local_56 = local_2.GetLevelConfig(this.GetLevel());
        if (local_56)
        {
            return ::NumericUtils::AsInt32(local_56.opArrow().UpgradeExp);
        }
        return 0;
    }
    int GetMaxLevel() const property
    {
        const UPlayerInfoSettings local_2;
        GetGameplaySettings<UPlayerInfoSettings> local_4;
        local_2 = local_4;
        return local_2.GetMaxLevel();
    }
    void GS_OnPlayerLevelNotify(const FPbPlayerLevelDataNotify &inout Notify)
    {
        int local_1;
        int local_4;
        int local_7;
        int local_2 = this.GetLevel();
        local_1 = local_2;
        int local_2_2 = ::NumericUtils::AsInt32(Notify.GetLevel());
        this.SetLevel(local_2_2);
        int local_2_3 = this.GetCurrentExp();
        local_4 = local_2_3;
        int local_2_4 = ::NumericUtils::AsInt32(Notify.GetCurExp());
        this.SetCurrentExp(local_2_4);
        int local_2_5 = ::NumericUtils::AsInt32(Notify.GetOverflowExp());
        this.SetbIsExpOverflow((local_2_5 > 0));
        this.SetCurrentExp((this.GetCurrentExp() + local_2_5));
        local_7 = this.GetLevelBreakthroughStatus();
        this.SetLevelBreakthroughStatus(::NumericUtils::AsInt32(Notify.GetLevelBreakthroughStatus()));
        this.SetServerLevelCap(::NumericUtils::AsInt32(Notify.GetServerLevelCap()));
        this.SetNextLevelCapUnlockTime(Notify.GetNextLevelCapUnlockTime());
        this.GetModify_UnlockedStigmataIds().Empty(0);
        TArray<uint> local_14;
        Notify.GetUnlockedStigmataList(local_14);
        for (auto local_27 : local_14)
        {
            this.GetModify_UnlockedStigmataIds().Add(local_27);
        }
        if (this.GetLevelBreakthroughStatus() == 2 || (this.GetLevelBreakthroughStatus() == 3))
        {
            if (!(::FMS_RedDotSystem::Get(this.GetContext().Manager).HasRedDot(GameplayTags::RedDotSystem_Stigmata_NewBreakthrough, 0)))
            {
                ::FMS_RedDotSystem::Get(this.GetContext().Manager).GenerateRedDot(ERedPointEvent(20), TArray<uint64>());
            }
        }
        else
        {
            ::FMS_RedDotSystem::Get(this.GetContext().Manager).ConsumeRedDot(GameplayTags::RedDotSystem_Stigmata_NewBreakthrough, 0);
        }
        TArray<uint64> local_42;
        if (this.GetbIsLevelInit())
        {
            for (auto local_59 : this.GetUnlockedStigmataIds())
            {
                if (!(this.GetPrevUnlockedStigmataIds().Contains(local_59)))
                {
                    int64 local_32 = local_59;
                    local_42.Add(local_32);
                }
            }
            if (!(local_42.IsEmpty()))
            {
                ::FMS_RedDotSystem::Get(this.GetContext().Manager).GenerateRedDot(ERedPointEvent(16), local_42);
            }
        }
        this.GetModify_PrevUnlockedStigmataIds().Empty(0);
        for (auto local_59 : this.GetUnlockedStigmataIds())
        {
            this.GetModify_PrevUnlockedStigmataIds().Add(local_59);
        }
        this.GetModify_MetBreakthroughCondIds().Empty(0);
        TArray<uint> local_64;
        Notify.GetMetLevelBreakthroughCondList(local_64);
        for (auto local_27 : local_64)
        {
            this.GetModify_MetBreakthroughCondIds().Add(local_27);
        }
        if (this.GetbIsLevelInit() && (this.GetLevel() != local_1 || (this.GetCurrentExp() != local_4)))
        {
            if (!(this.GetbIsDisplayLevelUpPopup()))
            {
                this.SetDisplayLevelUpFromLevel(local_1);
                this.SetDisplayLevelUpToLevel(this.GetLevel());
                this.SetDisplayLevelUpFromExp(local_4);
                this.SetDisplayLevelUpToExp(this.GetCurrentExp());
                this.SetbDisplayIsOverflow(this.GetbIsExpOverflow() || (this.GetLevel() == this.GetServerLevelCap()));
                this.SetbDisplayIsBreakthroughLevel((this.GetCurrentBreakthroughLevel() == this.GetLevel()));
                this.SetbIsDisplayLevelUpPopup(true);
                this.ShowLevelUpPopup(this.GetDisplayLevelUpFromLevel(), this.GetDisplayLevelUpToLevel());
            }
            else
            {
                this.SetDisplayLevelUpToLevel(this.GetLevel());
                this.SetDisplayLevelUpToExp(this.GetCurrentExp());
                this.SetbDisplayIsOverflow(this.GetbIsExpOverflow() || (this.GetLevel() == this.GetServerLevelCap()));
                this.SetbDisplayIsBreakthroughLevel((this.GetCurrentBreakthroughLevel() == this.GetLevel()));
            }
        }
        if (!(local_42.IsEmpty()))
        {
            this.ShowStigmataUnlockedHints(local_42);
        }
        this.SetbIsLevelInit(true);
        FEUIModelRef local_72 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus).opCall(local_72);
        FEUIModelRef local_72_2 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus).opCall(local_72_2);
        return;
    }
    void GS_OnPlayerLoginRsp(const FPbGetPlayerTokenRsp &inout Rsp)
    {
        this.SetLocalPlayerUidFromGS(Rsp.GetUid());
        return;
    }
    void ShowLevelUpPopup(const int FromLevel, const int ToLevel)
    {
        const UPlayerInfoSettings local_2;
        GetGameplaySettings<UPlayerInfoSettings> local_4;
        local_2 = local_4;
        int local_8 = local_2.GetLevelUpAttributeHpGrow(FromLevel, ToLevel);
        int local_9 = 0;
        float32 local_11 = 5.0f;
        if (local_2.LevelUpBannerMessageHintConfig)
        {
            local_9 = local_2.LevelUpBannerMessageHintConfig.opArrow().Priority;
            local_11 = local_2.LevelUpBannerMessageHintConfig.opArrow().ExtraParam.LifetimeOverride;
        }
        int local_10 = uint(local_8);
        ::CommonPopup::LevelUpBanner(FText::FromString(FString().Append(ToLevel)), FText::FromString(FString().Append("+").Append(local_10)), local_11, local_9);
        return;
    }
    FString GetPlayerNameString() const
    {
        ::FASCommonUtils::GetLocalPlayerProxy();
        Get local_12;
        const FC_DSPlayerInfo& local_14 = local_12.opCall();
        if (local_14)
        {
            return local_14.GetNickName();
        }
        return "";
    }
    void GS_RequestLevelBreakthrough()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void GS_RequestChangePlayerName(const FString &inout NewPlayerName)
    {
        FPbSetNicknameReq local_4;
        local_4.SetNickname(NewPlayerName);
        this.SendProto(local_4.ToWrapper());
        return;
    }
    void GS_OnChangeNameNotify(const FPbSetNicknameRsp &inout Notify)
    {
        FEUIModelRef local_6 = FEUIModelRef(this);
        FEUIMessageBus::PublishOrPatch(EUIMessageBus);
        FMsg_LocalPlayerChangeNameRsp local_8;
        local_8.RetCode = Notify.GetRetcode();
        return;
    }
    void ShowStigmataUnlockedHints(const TArray<uint64> &inout NewStigmataParams)
    {
        const UPlayerInfoSettings local_2;
        GetGameplaySettings<UPlayerInfoSettings> local_4;
        int local_34 = 0;
        const FStigmataConfig& local_146;
        local_2 = local_4;
        if ((!((local_2 != nullptr))))
        {
            return;
        }
        TArray<int> local_12;
        for (auto local_26 : NewStigmataParams)
        {
            local_12.Add(local_26);
        }
        if (!(this.GetPlayerLevelInfoRef().IsValid()))
        {
            this.SetPlayerLevelInfoRef(TEUIModelRef<FVMS_PlayerLevelInfo>(::FVMS_PlayerLevelInfo::Get(this.GetContext().Manager)));
        }
        TEUIModelRef<FVMS_PlayerLevelInfo> local_32 = this.GetPlayerLevelInfoRef();
        auto local_40 = local_12.Iterator();
        for (; local_40.CanProceed;)
        {
            int local_29 = local_40.Proceed();
            GetDataObjectByGSDataId<FStigmataConfig> local_96;
            if (!(local_96.opImplConv().IsSet()))
            {
                continue;
            }
            if (local_146.UnlockCost.Num() != 0)
            {
                continue;
            }
            FSoftBrush local_154;
            FText::Format(local_146.Name, local_2.StigmataUnlockContentFormat, local_154);
            FSimpleModelEvent local_176;
            local_176.Add(local_34, FVMS_PlayerLevelInfo::GotoStigmataDetail);
            FInputActionListConstructParam local_180;
            local_180.InputActionListConstructParamItems.Add(FInputActionListConstructParamItem(FEUIInputAction(local_2.StigmataUnlockConfirmAction), local_176));
        }
        return;
    }
    void OnWidgetPresenceChanged(const FMsg_WidgetPresence &inout Msg)
    {
        const UPlayerInfoSettings local_8;
        int local_31 = 0;
        bool local_3 = !((FGameplayTag(Msg.WidgetTag) == GameplayTags::UI_Type_StigmataDetail));
        if (local_3)
        {
            local_3 = true;
        }
        else
        {
            local_3 = Msg.bPresented;
        }
        if (local_3)
        {
            return;
        }
        FMS_RedDotSystem& local_6 = ::FMS_RedDotSystem::Get(this.GetContext().Manager);
        GetGameplaySettings<UPlayerInfoSettings> local_10;
        local_8 = local_10;
        for (auto& local_30 : local_8.GetAllNoCostStigmataConfigs())
        {
            if (local_30.IsSet())
            {
                int64 local_34 = local_31;
                local_6.ConsumeRedDot(GameplayTags::RedDotSystem_Stigmata_NewStigmata, local_34);
            }
        }
        return;
    }
    uint GetLocalPlayerUidFromGS() const property
    {
        this.TrackPropertyRead(0);
        return this.m_LocalPlayerUidFromGS;
    }
    void SetLocalPlayerUidFromGS(const uint __Value) property
    {
        if (this.m_LocalPlayerUidFromGS == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_LocalPlayerUidFromGS = __Value;
        return;
    }
    int GetLevel() const property
    {
        this.TrackPropertyRead(1);
        return this.m_Level;
    }
    void SetLevel(const int __Value) property
    {
        if (this.m_Level == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Level = __Value;
        return;
    }
    int GetCurrentExp() const property
    {
        this.TrackPropertyRead(2);
        return this.m_CurrentExp;
    }
    void SetCurrentExp(const int __Value) property
    {
        if (this.m_CurrentExp == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CurrentExp = __Value;
        return;
    }
    bool GetbIsExpOverflow() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bIsExpOverflow;
    }
    void SetbIsExpOverflow(const bool __Value) property
    {
        if (!(this.m_bIsExpOverflow) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bIsExpOverflow = __Value;
        return;
    }
    int GetLevelBreakthroughStatus() const property
    {
        this.TrackPropertyRead(4);
        return this.m_LevelBreakthroughStatus;
    }
    void SetLevelBreakthroughStatus(const int __Value) property
    {
        if (this.m_LevelBreakthroughStatus == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_LevelBreakthroughStatus = __Value;
        return;
    }
    int GetServerLevelCap() const property
    {
        this.TrackPropertyRead(5);
        return this.m_ServerLevelCap;
    }
    void SetServerLevelCap(const int __Value) property
    {
        if (this.m_ServerLevelCap == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_ServerLevelCap = __Value;
        return;
    }
    int64 GetNextLevelCapUnlockTime() const property
    {
        this.TrackPropertyRead(6);
        return this.m_NextLevelCapUnlockTime;
    }
    void SetNextLevelCapUnlockTime(const int64 __Value) property
    {
        if (this.m_NextLevelCapUnlockTime == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_NextLevelCapUnlockTime = __Value;
        return;
    }
    bool GetbIsLevelInit() const property
    {
        this.TrackPropertyRead(7);
        return this.m_bIsLevelInit;
    }
    void SetbIsLevelInit(const bool __Value) property
    {
        if (!(this.m_bIsLevelInit) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_bIsLevelInit = __Value;
        return;
    }
    int GetDisplayLevelUpFromLevel() const property
    {
        this.TrackPropertyRead(8);
        return this.m_DisplayLevelUpFromLevel;
    }
    void SetDisplayLevelUpFromLevel(const int __Value) property
    {
        if (this.m_DisplayLevelUpFromLevel == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_DisplayLevelUpFromLevel = __Value;
        return;
    }
    int GetDisplayLevelUpToLevel() const property
    {
        this.TrackPropertyRead(9);
        return this.m_DisplayLevelUpToLevel;
    }
    void SetDisplayLevelUpToLevel(const int __Value) property
    {
        if (this.m_DisplayLevelUpToLevel == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_DisplayLevelUpToLevel = __Value;
        return;
    }
    int GetDisplayLevelUpFromExp() const property
    {
        this.TrackPropertyRead(10);
        return this.m_DisplayLevelUpFromExp;
    }
    void SetDisplayLevelUpFromExp(const int __Value) property
    {
        if (this.m_DisplayLevelUpFromExp == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_DisplayLevelUpFromExp = __Value;
        return;
    }
    int GetDisplayLevelUpToExp() const property
    {
        this.TrackPropertyRead(11);
        return this.m_DisplayLevelUpToExp;
    }
    void SetDisplayLevelUpToExp(const int __Value) property
    {
        if (this.m_DisplayLevelUpToExp == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_DisplayLevelUpToExp = __Value;
        return;
    }
    bool GetbDisplayIsOverflow() const property
    {
        this.TrackPropertyRead(12);
        return this.m_bDisplayIsOverflow;
    }
    void SetbDisplayIsOverflow(const bool __Value) property
    {
        if (!(this.m_bDisplayIsOverflow) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_bDisplayIsOverflow = __Value;
        return;
    }
    bool GetbDisplayIsBreakthroughLevel() const property
    {
        this.TrackPropertyRead(13);
        return this.m_bDisplayIsBreakthroughLevel;
    }
    void SetbDisplayIsBreakthroughLevel(const bool __Value) property
    {
        if (!(this.m_bDisplayIsBreakthroughLevel) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_bDisplayIsBreakthroughLevel = __Value;
        return;
    }
    bool GetbIsDisplayLevelUpPopup() const property
    {
        this.TrackPropertyRead(14);
        return this.m_bIsDisplayLevelUpPopup;
    }
    void SetbIsDisplayLevelUpPopup(const bool __Value) property
    {
        if (!(this.m_bIsDisplayLevelUpPopup) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_bIsDisplayLevelUpPopup = __Value;
        return;
    }
    const TSet<int> GetUnlockedStigmataIds() const property
    {
        const TSet<int> __r;
        this.TrackPropertyRead(15);
        return __r;
    }
    TSet<int> GetModify_UnlockedStigmataIds() property
    {
        TSet<int> __r;
        this.MarkPropertyDirty(15);
        return __r;
    }
    void SetUnlockedStigmataIds(const TSet<int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_UnlockedStigmataIds = __Value;
        return;
    }
    const TSet<int> GetPrevUnlockedStigmataIds() const property
    {
        const TSet<int> __r;
        this.TrackPropertyRead(16);
        return __r;
    }
    TSet<int> GetModify_PrevUnlockedStigmataIds() property
    {
        TSet<int> __r;
        this.MarkPropertyDirty(16);
        return __r;
    }
    void SetPrevUnlockedStigmataIds(const TSet<int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_PrevUnlockedStigmataIds = __Value;
        return;
    }
    TEUIModelRef<FVMS_PlayerLevelInfo> GetPlayerLevelInfoRef() const property
    {
        this.TrackPropertyRead(17);
        return this.m_PlayerLevelInfoRef;
    }
    void SetPlayerLevelInfoRef(const TEUIModelRef<FVMS_PlayerLevelInfo> &inout __Value) property
    {
        TEUIModelRef<FVMS_PlayerLevelInfo> local_2;
        local_2 = this.m_PlayerLevelInfoRef;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_PlayerLevelInfoRef = __Value;
        return;
    }
    const TSet<int> GetMetBreakthroughCondIds() const property
    {
        const TSet<int> __r;
        this.TrackPropertyRead(18);
        return __r;
    }
    TSet<int> GetModify_MetBreakthroughCondIds() property
    {
        TSet<int> __r;
        this.MarkPropertyDirty(18);
        return __r;
    }
    void SetMetBreakthroughCondIds(const TSet<int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(18);
        this.m_MetBreakthroughCondIds = __Value;
        return;
    }
}

namespace FM_LocalPlayerLevel
{
FM_LocalPlayerLevel& Get(const UObject ContextObject)
{
    return FM_LocalPlayerLevel::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FM_LocalPlayerLevel GetByManager(const UEUIManagerSubsystem Manager)
{
    FM_LocalPlayerLevel __r;
    TEUIModelRef<FM_LocalPlayerLevel> local_6 = TEUIModelRef<FM_LocalPlayerLevel>(EUIInternal::MakeModelWithManager(Manager, FM_LocalPlayerLevel::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelProtoRspDefine local_10;
    local_10.FunctionName = "__GS_OnPlayerLevelNotify";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnPlayerLoginRsp";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnChangeNameNotify";
    Result.ProtoRspDefines.Add(local_10);
    FEUIModelMsgHandleDefine local_22;
    local_22.FunctionName = "__OnWidgetPresenceChanged";
    local_22.MessageTypeName = "Msg_WidgetPresence";
    local_22.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_22);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_LocalPlayerLevel;
}
void __GS_OnPlayerLevelNotify(FM_LocalPlayerLevel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnPlayerLevelNotify(FPbPlayerLevelDataNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnPlayerLoginRsp(FM_LocalPlayerLevel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnPlayerLoginRsp(FPbGetPlayerTokenRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnChangeNameNotify(FM_LocalPlayerLevel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnChangeNameNotify(FPbSetNicknameRsp::FromWrapper(ProtoWrapper));
    return;
}
void __OnWidgetPresenceChanged(FM_LocalPlayerLevel &inout Model, const FMsg_WidgetPresence &inout Message)
{
    Model.OnWidgetPresenceChanged(Message);
    return;
}
int __IndexOf_LocalPlayerUidFromGS()
{
    return 0;
}
int __IndexOf_Level()
{
    return 1;
}
int __IndexOf_CurrentExp()
{
    return 2;
}
int __IndexOf_bIsExpOverflow()
{
    return 3;
}
int __IndexOf_LevelBreakthroughStatus()
{
    return 4;
}
int __IndexOf_ServerLevelCap()
{
    return 5;
}
int __IndexOf_NextLevelCapUnlockTime()
{
    return 6;
}
int __IndexOf_bIsLevelInit()
{
    return 7;
}
int __IndexOf_DisplayLevelUpFromLevel()
{
    return 8;
}
int __IndexOf_DisplayLevelUpToLevel()
{
    return 9;
}
int __IndexOf_DisplayLevelUpFromExp()
{
    return 10;
}
int __IndexOf_DisplayLevelUpToExp()
{
    return 11;
}
int __IndexOf_bDisplayIsOverflow()
{
    return 12;
}
int __IndexOf_bDisplayIsBreakthroughLevel()
{
    return 13;
}
int __IndexOf_bIsDisplayLevelUpPopup()
{
    return 14;
}
int __IndexOf_UnlockedStigmataIds()
{
    return 15;
}
int __IndexOf_PrevUnlockedStigmataIds()
{
    return 16;
}
int __IndexOf_PlayerLevelInfoRef()
{
    return 17;
}
int __IndexOf_MetBreakthroughCondIds()
{
    return 18;
}
}
