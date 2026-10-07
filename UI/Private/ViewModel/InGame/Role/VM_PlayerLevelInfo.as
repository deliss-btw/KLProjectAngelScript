
namespace FVMS_PlayerLevelInfo
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature GotoStigmataDetail = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature GotoBreakthrough = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature GotoStigmataOrBreakthrough = FEUIModelCallbackSignature();

}
struct FVMS_PlayerLevelInfo : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    TEUIModelRef<FM_LocalPlayerLevel> m_PlayerLevel;
    UPROPERTY()
    FMW_CounterDown m_ServerLevelCapCounterDown;
    UPROPERTY()
    TEUIModelRef<FVM_TitleAndDesc> m_TitleHoverTips;
    UPROPERTY()
    TEUIModelRef<FVM_RedDot> m_RedDotStigmataMenu;

    FVMS_PlayerLevelInfo()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_PlayerLevelInfo(const FVMS_PlayerLevelInfo &inout Other)
    {
        this.m_PlayerLevel = Other.m_PlayerLevel;
        this.m_ServerLevelCapCounterDown = Other.m_ServerLevelCapCounterDown;
        this.m_TitleHoverTips = Other.m_TitleHoverTips;
        this.m_RedDotStigmataMenu = Other.m_RedDotStigmataMenu;
        return;
    }
    FVMS_PlayerLevelInfo& opAssign(const FVMS_PlayerLevelInfo &inout Other)
    {
        this.m_PlayerLevel = Other.m_PlayerLevel;
        this.m_ServerLevelCapCounterDown = Other.m_ServerLevelCapCounterDown;
        this.m_TitleHoverTips = Other.m_TitleHoverTips;
        return Other.m_RedDotStigmataMenu;
    }
    void PostConstruct()
    {
        this.SetPlayerLevel(TEUIModelRef<FM_LocalPlayerLevel>(::FM_LocalPlayerLevel::Get(this.GetContext().Manager)));
        this.SetRedDotStigmataMenu(TEUIModelRef<FVM_RedDot>(::FVM_RedDot::Create(this.GetContext().Manager, FRedDotNodeData(GameplayTags::RedDotSystem_Stigmata_Menu, 0))));
        FText local_14;
        FText local_18;
        GetDataObjectByGSDataId<FExpOverflowConfig> local_66;
        TDataObjectPtr<FExpOverflowConfig> local_92 = local_66.opImplConv();
        if (local_92)
        {
            const FExpOverflowConfig& local_120;
            FText local_124;
            if (local_120.GetConvertResourceType())
            {
            }
            local_14 = NSLOCTEXT("ExpOverflowTips", "з»ЏйЄЊжєўе‡єиЇґжЋ");
            local_18 = FText::Format(NSLOCTEXT("ExpOverflowTipsDesc", "иѕѕе€°зЄЃз ґз­‰зє§ж€–жњЌеЉЎе™Ёз­‰зє§дёЉй™ђж—¶пјЊз»ЏйЄЊиЋ·еЏ–иЎ°е‡Џ{0}%пјЊжњЂе¤§з»ЏйЄЊе­е‚ЁдёЉй™ђ{1}\nиѕѕе€°з»ЏйЄЊе­е‚Ёж€–жњЂе¤§з­‰зє§дёЉй™ђж—¶пјЊз»ЏйЄЊиЋ·еЏ–жЊ‰{2}%жЇ”дѕ‹жЉз®—дёє{3}"), local_120.ExpDecRatio, local_120.ExpOverflowLimit, local_120.ExpConvertRatio, local_124);
        }
        this.SetTitleHoverTips(TEUIModelRef<FVM_TitleAndDesc>(::FVM_TitleAndDesc::Create(this.GetContext().Manager, local_14, local_18)));
        return;
    }
    int GetLevel() const
    {
        return this.GetPlayerLevel().opArrow().GetLevel();
    }
    FText GetLevelText() const
    {
        return FText::Format(NSLOCTEXT("LvlFormat", "Lv {0}"), this.GetPlayerLevel().opArrow().GetLevel());
    }
    void RefreshServerLevelCapCounterDown()
    {
        if (!(this.ShouldShowServerLevelCapCountdownFromSource()))
        {
            return;
        }
        this.GetModify_ServerLevelCapCounterDown().SetRemainedTimeWithPrecision(FFPTime(this.GetServerLevelCapRemainingSecondsFromTimestamp()), EMWCounterDownPrecision(0));
        return;
    }
    FText GetLevelTitleText() const
    {
        FText local_6;
        if (!(this.ShouldShowServerLevelCapCountdown()))
        {
            NSLOCTEXT(local_6, "LevelTitle");
            return local_6;
        }
        this.GetServerLevelCapRemainingTimeText();
        return FText::Format(NSLOCTEXT("ServerLevelCapCountdown", "з­‰зє§дёЉй™ђеЂ’и®Ўж—¶:{0}"), local_6);
    }
    int GetCurrentExp() const
    {
        return this.GetPlayerLevel().opArrow().GetCurrentExp();
    }
    int GetUpgradeExp() const
    {
        const UPlayerInfoSettings local_2;
        GetGameplaySettings<UPlayerInfoSettings> local_4;
        local_2 = local_4;
        TDataObjectPtr<FPlayerLevelConfig> local_58 = local_2.GetLevelConfig(this.GetPlayerLevel().opArrow().GetLevel());
        if (local_58)
        {
            return ::NumericUtils::AsInt32(local_58.opArrow().UpgradeExp);
        }
        return 0;
    }
    float32 GetExpPercent() const
    {
        int local_2 = this.GetUpgradeExp();
        if (local_2 <= 0)
        {
            return 1.0f;
        }
        return FMath::Clamp((this.GetPlayerLevel().opArrow().GetCurrentExp() / local_2), 0.0f, 1.0f);
    }
    FText GetExpText() const
    {
        return FText::Format(NSLOCTEXT("EXPFormat", "{0}/{1}"), this.GetPlayerLevel().opArrow().GetCurrentExp(), this.GetUpgradeExp());
    }
    FText GetExpTextWithColor() const
    {
        int local_3;
        int local_2 = this.GetUpgradeExp();
        local_3 = this.GetPlayerLevel().opArrow().GetCurrentExp();
        if (this.GetPlayerLevel().opArrow().GetbIsExpOverflow())
        {
            return FText::Format(NSLOCTEXT("EXPFormatOverflow", "<Yellow20>{0}</>/{1}"), local_3, local_2);
        }
        return FText::Format(NSLOCTEXT("EXPFormatNormal", "{0}/{1}"), local_3, local_2);
    }
    bool GetIsMaxLevel() const
    {
        return (this.GetPlayerLevel().opArrow().GetLevel() >= this.GetPlayerLevel().opArrow().GetMaxLevel());
    }
    bool GetIsExpOverflow() const
    {
        return this.GetPlayerLevel().opArrow().GetbIsExpOverflow();
    }
    ESlateVisibility GetExpOverflowVisibility() const
    {
        int local_4;
        if (this.GetPlayerLevel().opArrow().GetbIsExpOverflow())
        {
            local_4 = 0;
        }
        else
        {
            local_4 = 1;
        }
        return ESlateVisibility(local_4);
    }
    int GetLevelBreakthroughStatus() const
    {
        return this.GetPlayerLevel().opArrow().GetLevelBreakthroughStatus();
    }
    int GetLevelBreakthroughStatusIndex() const
    {
        switch (this.GetPlayerLevel().opArrow().GetLevelBreakthroughStatus())
        {
        case 0:
        case 1:
        case 4:
        {
            return 0;
        }
        case 2:
        {
            return 1;
        }
        case 3:
        {
            return 2;
        }
        default:
        {
        }
        }
        return 0;
    }
    void OnLevelRefresh(const FMsg_LocalPlayerLevelRefresh &inout Msg)
    {
        return;
    }
    bool ShouldShowServerLevelCapCountdownFromSource() const
    {
        return this.GetPlayerLevel().opArrow().GetServerLevelCap() > 0 && (this.GetPlayerLevel().opArrow().GetNextLevelCapUnlockTime() > 0) && (this.GetPlayerLevel().opArrow().GetLevel() >= this.GetPlayerLevel().opArrow().GetServerLevelCap()) && (this.GetPlayerLevel().opArrow().GetCurrentBreakthroughLevel() > this.GetPlayerLevel().opArrow().GetServerLevelCap()) && (this.GetServerLevelCapRemainingSecondsFromTimestamp() > 0);
    }
    bool ShouldShowServerLevelCapCountdown() const
    {
        return this.ShouldShowServerLevelCapCountdownFromSource() && (this.GetServerLevelCapRemainingSeconds() > 0);
    }
    int GetServerLevelCapRemainingSecondsFromTimestamp() const
    {
        int local_7 = (this.GetPlayerLevel().opArrow().GetNextLevelCapUnlockTime() - ::FASCommonUtils::GetTimestamp());
        return FMath::Max(0, local_7);
    }
    int GetServerLevelCapRemainingSeconds() const
    {
        return FMath::CeilToInt(FMath::Max(float32(this.GetServerLevelCapCounterDown().GetRemainedTime().ToSeconds()), 0.0f));
    }
    FText GetServerLevelCapRemainingTimeText() const
    {
        int local_2 = this.GetServerLevelCapRemainingSeconds();
        if (local_2 > 86400)
        {
            return FText::Format(NSLOCTEXT("ServerLevelCapCountdownDays", "{0}е¤©"), FMath::IntegerDivisionTrunc(((local_2 + 86400) - 1), 86400));
        }
        if (local_2 > 3600)
        {
            return FText::Format(NSLOCTEXT("ServerLevelCapCountdownHours", "{0}ж—¶"), FMath::IntegerDivisionTrunc(local_2, 3600));
        }
        return FText::Format(NSLOCTEXT("ServerLevelCapCountdownMinutes", "{0}е€†"), (FMath::Max(1, FMath::IntegerDivisionTrunc(((local_2 + 60) - 1), 60))));
    }
    void GotoStigmataDetail()
    {
        if (FEUIWidget::FindWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_StigmataDetail))
        {
            return;
        }
        FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_StigmataDetail);
        return;
    }
    void GotoBreakthrough()
    {
        if (FEUIWidget::FindWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_BreakThrough))
        {
            return;
        }
        FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_BreakThrough);
        return;
    }
    void GotoStigmataOrBreakthrough()
    {
        int local_3 = this.GetPlayerLevel().opArrow().GetLevelBreakthroughStatus();
        if (local_3 <= 3)
        {
            if (local_3 != 2)
            {
                if (local_3 != 3)
                {
                }
                else
                {
                }
            }
            this.GotoBreakthrough();
            return;
        }
        this.GotoStigmataDetail();
        return;
    }
    TEUIModelRef<FM_LocalPlayerLevel> GetPlayerLevel() const property
    {
        this.TrackPropertyRead(0);
        return this.m_PlayerLevel;
    }
    void SetPlayerLevel(const TEUIModelRef<FM_LocalPlayerLevel> &inout __Value) property
    {
        TEUIModelRef<FM_LocalPlayerLevel> local_2;
        local_2 = this.m_PlayerLevel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PlayerLevel = __Value;
        return;
    }
    const FMW_CounterDown GetServerLevelCapCounterDown() const property
    {
        const FMW_CounterDown __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FMW_CounterDown GetModify_ServerLevelCapCounterDown() property
    {
        FMW_CounterDown __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetServerLevelCapCounterDown(const FMW_CounterDown &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ServerLevelCapCounterDown = __Value;
        return;
    }
    TEUIModelRef<FVM_TitleAndDesc> GetTitleHoverTips() const property
    {
        this.TrackPropertyRead(2);
        return this.m_TitleHoverTips;
    }
    void SetTitleHoverTips(const TEUIModelRef<FVM_TitleAndDesc> &inout __Value) property
    {
        TEUIModelRef<FVM_TitleAndDesc> local_2;
        local_2 = this.m_TitleHoverTips;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_TitleHoverTips = __Value;
        return;
    }
    TEUIModelRef<FVM_RedDot> GetRedDotStigmataMenu() const property
    {
        this.TrackPropertyRead(3);
        return this.m_RedDotStigmataMenu;
    }
    void SetRedDotStigmataMenu(const TEUIModelRef<FVM_RedDot> &inout __Value) property
    {
        TEUIModelRef<FVM_RedDot> local_2;
        local_2 = this.m_RedDotStigmataMenu;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_RedDotStigmataMenu = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_PlayerLevelInfo
{
    UPROPERTY()
    int Level;
    UPROPERTY()
    FText LevelText;
    UPROPERTY()
    FText LevelTitleText;
    UPROPERTY()
    int CurrentExp;
    UPROPERTY()
    int UpgradeExp;
    UPROPERTY()
    float32 ExpPercent;
    UPROPERTY()
    FText ExpText;
    UPROPERTY()
    FText ExpTextWithColor;
    UPROPERTY()
    bool IsMaxLevel;
    UPROPERTY()
    bool IsExpOverflow;
    UPROPERTY()
    ESlateVisibility ExpOverflowVisibility;
    UPROPERTY()
    int LevelBreakthroughStatus;
    UPROPERTY()
    int LevelBreakthroughStatusIndex;
    UPROPERTY()
    TEUIModelRef<FVMS_PlayerLevelInfo> Self;


}

namespace FVMS_PlayerLevelInfo
{
FVMS_PlayerLevelInfo& Get(const UObject ContextObject)
{
    return FVMS_PlayerLevelInfo::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_PlayerLevelInfo GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_PlayerLevelInfo __r;
    TEUIModelRef<FVMS_PlayerLevelInfo> local_6 = TEUIModelRef<FVMS_PlayerLevelInfo>(EUIInternal::MakeModelWithManager(Manager, FVMS_PlayerLevelInfo::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TitleHoverTips";
    local_14.TypeName = "TEUIModelRef<FVM_TitleAndDesc>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RedDotStigmataMenu";
    local_14.TypeName = "TEUIModelRef<FVM_RedDot>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Level";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LevelText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LevelTitleText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentExp";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "UpgradeExp";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ExpPercent";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ExpText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ExpTextWithColor";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsMaxLevel";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsExpOverflow";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ExpOverflowVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LevelBreakthroughStatus";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LevelBreakthroughStatusIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_PlayerLevelInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_PlayerLevelInfo;
    FEUIModelWatcherProperty local_19;
    local_19.PropertyName = FName("ServerLevelCapCounterDown");
    int local_2_2 = FVMS_PlayerLevelInfo::__IndexOf_ServerLevelCapCounterDown();
    Result.WatcherProperties.Add(local_19);
    FEUIModelEffectDefine local_26;
    local_26.FunctionName = "RefreshServerLevelCapCounterDown";
    Result.EffectFunctions.Add(local_26);
    FEUIModelMsgHandleDefine local_36;
    local_36.FunctionName = "__OnLevelRefresh";
    local_36.MessageTypeName = "Msg_LocalPlayerLevelRefresh";
    local_36.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_36);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_PlayerLevelInfo;
}
void __OnLevelRefresh(FVMS_PlayerLevelInfo &inout Model, const FMsg_LocalPlayerLevelRefresh &inout Message)
{
    Model.OnLevelRefresh(Message);
    return;
}
TEUIModelRef<FVM_TitleAndDesc> __UIGetter_TitleHoverTips(const FVMS_PlayerLevelInfo &inout Model)
{
    return Model.GetTitleHoverTips();
}
TEUIModelRef<FVM_RedDot> __UIGetter_RedDotStigmataMenu(const FVMS_PlayerLevelInfo &inout Model)
{
    return Model.GetRedDotStigmataMenu();
}
int __UIGetter_Level(const FVMS_PlayerLevelInfo &inout Model)
{
    return Model.GetLevel();
}
FText __UIGetter_LevelText(const FVMS_PlayerLevelInfo &inout Model)
{
    return Model.GetLevelText();
}
FText __UIGetter_LevelTitleText(const FVMS_PlayerLevelInfo &inout Model)
{
    return Model.GetLevelTitleText();
}
int __UIGetter_CurrentExp(const FVMS_PlayerLevelInfo &inout Model)
{
    return Model.GetCurrentExp();
}
int __UIGetter_UpgradeExp(const FVMS_PlayerLevelInfo &inout Model)
{
    return Model.GetUpgradeExp();
}
float32 __UIGetter_ExpPercent(const FVMS_PlayerLevelInfo &inout Model)
{
    return Model.GetExpPercent();
}
FText __UIGetter_ExpText(const FVMS_PlayerLevelInfo &inout Model)
{
    return Model.GetExpText();
}
FText __UIGetter_ExpTextWithColor(const FVMS_PlayerLevelInfo &inout Model)
{
    return Model.GetExpTextWithColor();
}
bool __UIGetter_IsMaxLevel(const FVMS_PlayerLevelInfo &inout Model)
{
    return Model.GetIsMaxLevel();
}
bool __UIGetter_IsExpOverflow(const FVMS_PlayerLevelInfo &inout Model)
{
    return Model.GetIsExpOverflow();
}
ESlateVisibility __UIGetter_ExpOverflowVisibility(const FVMS_PlayerLevelInfo &inout Model)
{
    return Model.GetExpOverflowVisibility();
}
int __UIGetter_LevelBreakthroughStatus(const FVMS_PlayerLevelInfo &inout Model)
{
    return Model.GetLevelBreakthroughStatus();
}
int __UIGetter_LevelBreakthroughStatusIndex(const FVMS_PlayerLevelInfo &inout Model)
{
    return Model.GetLevelBreakthroughStatusIndex();
}
TEUIModelRef<FVMS_PlayerLevelInfo> __UIGetter_Self(const FVMS_PlayerLevelInfo &inout Model)
{
    return TEUIModelRef<FVMS_PlayerLevelInfo>(Model);
}
int __IndexOf_PlayerLevel()
{
    return 0;
}
int __IndexOf_ServerLevelCapCounterDown()
{
    return 1;
}
int __IndexOf_TitleHoverTips()
{
    return 2;
}
int __IndexOf_RedDotStigmataMenu()
{
    return 3;
}
}
namespace __GeneratedProperties_FVMS_PlayerLevelInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
