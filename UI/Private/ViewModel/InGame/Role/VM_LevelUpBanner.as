
namespace FVM_LevelUpBanner
{
    const int ModelId = 0;

}
struct FVM_LevelUpBanner : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FFPTime m_ExpBarStartTime;
    UPROPERTY()
    FFPTime m_ExpBarDuration;
    UPROPERTY()
    FFPTime m_PostExpBarDelay;
    UPROPERTY()
    FFPTime m_TimeForAnimOut;
    UPROPERTY()
    int m_FromLevel;
    UPROPERTY()
    int m_ToLevel;
    UPROPERTY()
    int m_FromExp;
    UPROPERTY()
    int m_ToExp;
    UPROPERTY()
    int m_FromLevelMaxExp;
    UPROPERTY()
    int m_ToLevelMaxExp;
    UPROPERTY()
    bool m_bIsOverflow;
    UPROPERTY()
    bool m_bIsBreakthroughLevel;
    UPROPERTY()
    int m_ExpGrowth;
    UPROPERTY()
    TWeakObjectPtr<UWidget_LevelUpBanner> m_LevelUpBannerWidget;
    UPROPERTY()
    FFPTime m_CurrentTime;
    UPROPERTY()
    int m_CurrentExp;
    UPROPERTY()
    float32 m_ExpBarProgress;
    UPROPERTY()
    bool m_bLevelChanged;
    UPROPERTY()
    bool m_bExpGrowthFinished;
    UPROPERTY()
    bool m_bLevelUpAnimPlayed;

    FVM_LevelUpBanner()
    {
        this.m_FromLevel = 0;
        this.m_ToLevel = 0;
        this.m_FromExp = 0;
        this.m_ToExp = 0;
        this.m_FromLevelMaxExp = 0;
        this.m_ToLevelMaxExp = 0;
        this.m_bIsOverflow = false;
        this.m_bIsBreakthroughLevel = false;
        this.m_ExpGrowth = 0;
        this.m_CurrentExp = 0;
        this.m_ExpBarProgress = 0.0f;
        this.m_bLevelChanged = false;
        this.m_bExpGrowthFinished = false;
        this.m_bLevelUpAnimPlayed = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_LevelUpBanner(const FVM_LevelUpBanner &inout Other)
    {
        this.m_FromLevel = 0;
        this.m_ToLevel = 0;
        this.m_FromExp = 0;
        this.m_ToExp = 0;
        this.m_FromLevelMaxExp = 0;
        this.m_ToLevelMaxExp = 0;
        this.m_bIsOverflow = false;
        this.m_bIsBreakthroughLevel = false;
        this.m_ExpGrowth = 0;
        this.m_CurrentExp = 0;
        this.m_ExpBarProgress = 0.0f;
        this.m_bLevelChanged = false;
        this.m_bExpGrowthFinished = false;
        this.m_bLevelUpAnimPlayed = false;
        this.m_ExpBarStartTime = Other.m_ExpBarStartTime;
        this.m_ExpBarDuration = Other.m_ExpBarDuration;
        this.m_PostExpBarDelay = Other.m_PostExpBarDelay;
        this.m_TimeForAnimOut = Other.m_TimeForAnimOut;
        this.m_FromLevel = int(Other.m_FromLevel);
        this.m_ToLevel = int(Other.m_ToLevel);
        this.m_FromExp = int(Other.m_FromExp);
        this.m_ToExp = int(Other.m_ToExp);
        this.m_FromLevelMaxExp = int(Other.m_FromLevelMaxExp);
        this.m_ToLevelMaxExp = int(Other.m_ToLevelMaxExp);
        this.m_bIsOverflow = Other.m_bIsOverflow;
        this.m_bIsBreakthroughLevel = Other.m_bIsBreakthroughLevel;
        this.m_ExpGrowth = int(Other.m_ExpGrowth);
        this.m_LevelUpBannerWidget = Other.m_LevelUpBannerWidget;
        this.m_CurrentTime = Other.m_CurrentTime;
        this.m_CurrentExp = int(Other.m_CurrentExp);
        this.m_ExpBarProgress = Other.m_ExpBarProgress;
        this.m_bLevelChanged = Other.m_bLevelChanged;
        this.m_bExpGrowthFinished = Other.m_bExpGrowthFinished;
        this.m_bLevelUpAnimPlayed = Other.m_bLevelUpAnimPlayed;
        return;
    }
    FVM_LevelUpBanner opAssign(const FVM_LevelUpBanner &inout Other)
    {
        FVM_LevelUpBanner __r;
        this.m_ExpBarStartTime = Other.m_ExpBarStartTime;
        this.m_ExpBarDuration = Other.m_ExpBarDuration;
        this.m_PostExpBarDelay = Other.m_PostExpBarDelay;
        this.m_TimeForAnimOut = Other.m_TimeForAnimOut;
        this.m_FromLevel = int(Other.m_FromLevel);
        this.m_ToLevel = int(Other.m_ToLevel);
        this.m_FromExp = int(Other.m_FromExp);
        this.m_ToExp = int(Other.m_ToExp);
        this.m_FromLevelMaxExp = int(Other.m_FromLevelMaxExp);
        this.m_ToLevelMaxExp = int(Other.m_ToLevelMaxExp);
        this.m_bIsOverflow = Other.m_bIsOverflow;
        this.m_bIsBreakthroughLevel = Other.m_bIsBreakthroughLevel;
        this.m_ExpGrowth = int(Other.m_ExpGrowth);
        this.m_LevelUpBannerWidget = Other.m_LevelUpBannerWidget;
        this.m_CurrentTime = Other.m_CurrentTime;
        this.m_CurrentExp = int(Other.m_CurrentExp);
        this.m_ExpBarProgress = Other.m_ExpBarProgress;
        this.m_bLevelChanged = Other.m_bLevelChanged;
        this.m_bExpGrowthFinished = Other.m_bExpGrowthFinished;
        this.m_bLevelUpAnimPlayed = Other.m_bLevelUpAnimPlayed;
        return __r;
    }
    void LoadConfig(const FConfigVM_LevelUpBanner &inout InConfig)
    {
        this.SetExpBarDuration(InConfig.ExpBarDuration);
        this.SetPostExpBarDelay(InConfig.PostExpBarDelay);
        this.SetTimeForAnimOut(InConfig.TimeForAnimOut);
        this.SetExpBarStartTime(InConfig.ExpBarStartTime);
        return;
    }
    void PostConstruct()
    {
        const UPlayerInfoSettings local_6;
        int local_59;
        FM_LocalPlayerLevel& local_2 = ::FM_LocalPlayerLevel::Get(this.GetContext().Manager);
        this.SetFromLevel(local_2.GetDisplayLevelUpFromLevel());
        this.SetToLevel(local_2.GetDisplayLevelUpToLevel());
        this.SetFromExp(local_2.GetDisplayLevelUpFromExp());
        this.SetToExp(local_2.GetDisplayLevelUpToExp());
        this.SetbIsOverflow(local_2.GetbDisplayIsOverflow());
        this.SetbIsBreakthroughLevel(local_2.GetbDisplayIsBreakthroughLevel());
        GetGameplaySettings<UPlayerInfoSettings> local_8;
        local_6 = local_8;
        TDataObjectPtr<FPlayerLevelConfig> local_34 = local_6.GetLevelConfig(this.GetFromLevel());
        if (local_34)
        {
            local_59 = local_34.opArrow().UpgradeExp;
        }
        else
        {
            local_59 = 0;
        }
        this.SetFromLevelMaxExp(local_59);
        if (this.GetFromLevelMaxExp() < this.GetFromExp())
        {
            this.SetFromExp(this.GetFromLevelMaxExp());
        }
        if (this.GetFromLevel() != this.GetToLevel())
        {
            TDataObjectPtr<FPlayerLevelConfig> local_58 = local_6.GetLevelConfig(this.GetToLevel());
            if (local_58)
            {
                local_59 = local_58.opArrow().UpgradeExp;
            }
            else
            {
                local_59 = 0;
            }
            this.SetToLevelMaxExp(local_59);
        }
        else
        {
            this.SetToLevelMaxExp(this.GetFromLevelMaxExp());
        }
        this.SetCurrentExp(this.GetFromExp());
        this.SetExpGrowth((((::NumericUtils::AsInt32(local_6.GetLevelupTotalUpgradeExp(this.GetFromLevel(), this.GetToLevel()))) - this.GetFromExp()) + this.GetToExp()));
        local_2.SetbIsDisplayLevelUpPopup(false);
        this.SetExpBarProgress(this.CalculateExpBarProgress(this.GetCurrentExp(), 0, this.GetFromLevelMaxExp()));
        return;
    }
    void PostLoad()
    {
        if (this.GetFromLevel() == this.GetToLevel())
        {
            FFPTime local_8 = (FFPTime(this.GetExpBarStartTime()) + this.GetExpBarDuration());
            FFPTime local_6 = (local_8 + this.GetPostExpBarDelay());
            this.SetTimeForAnimOut(local_6);
        }
        return;
    }
    FText GetDisplayExpNum() const
    {
        int local_5;
        int local_6;
        if (this.GetbLevelChanged())
        {
            local_5 = this.GetToLevelMaxExp();
        }
        else
        {
            local_5 = this.GetFromLevelMaxExp();
        }
        local_6 = this.GetCurrentExp();
        if (local_6 > local_5)
        {
            return FText::FromString(FString::Format("<Yellow24F>{0}</>{1}{2}", local_6, "/", local_5));
        }
        return FText::FromString(FString::Format("{0}{1}{2}", local_6, "/", local_5));
    }
    FText GetDisplayExpGrowth() const
    {
        return FText::Format(NSLOCTEXT("ExpGrowth", "<Beige18>зїјз—•з»ЏйЄЊ</> +{0}"), this.GetExpGrowth());
    }
    FText GetDisplayAttributeGrowth() const
    {
        const UPlayerInfoSettings local_2;
        GetGameplaySettings<UPlayerInfoSettings> local_4;
        local_2 = local_4;
        int local_8 = FMath::CeilToInt(local_2.GetLevelUpAttributeHpGrow(this.GetFromLevel(), this.GetToLevel()));
        return FText::FromString(FString::Format("+{0}", local_8));
    }
    bool GetShouldDisplayOldLevelNum() const
    {
        return !(this.GetbLevelChanged());
    }
    bool GetReachLevelLimit() const
    {
        return this.GetbIsOverflow() && ((this.GetFromLevel() != this.GetToLevel() && this.GetbLevelChanged()) || (this.GetFromLevel() == this.GetToLevel()));
    }
    FText GetLevelLimitTips() const
    {
        if (!(this.GetbIsBreakthroughLevel()))
        {
            return NSLOCTEXT("ServerLevelLimitTips", "е·Іиѕѕе€°жњЌеЉЎе™Ёз­‰зє§дёЉй™ђ");
        }
        else
        {
            return NSLOCTEXT("BreakthroughLevelLimitTips", "е·Іиѕѕе€°з­‰зє§дёЉй™ђпјЊиЇ·е‰ЌеѕЂзЄЃз ґ");
        }
    }
    float32 CalculateExpBarProgress(const int Exp, const int StartExp, const int EndExp)
    {
        if (StartExp == EndExp)
        {
            return 1.0f;
        }
        return FMath::Clamp(((Exp - StartExp) * 1.0f) / (EndExp - StartExp), 0.0f, 1.0f);
    }
    void RefreshCurrentExp()
    {
        if ((FFPTime(this.GetCurrentTime()) == FPTime::FromInt(0)))
        {
            return;
        }
        if (FFPTime(this.GetCurrentTime()).opCmp(this.GetExpBarStartTime()) >= 0 && (FFPTime(this.GetCurrentTime()).opCmp((FFPTime(this.GetExpBarStartTime()) + this.GetExpBarDuration())) < 0))
        {
            bool local_11;
            float local_16 = ((FFPTime(this.GetCurrentTime()) - this.GetExpBarStartTime()) / this.GetExpBarDuration());
            if (this.GetFromLevel() == this.GetToLevel())
            {
                this.SetCurrentExp(FMath::CeilToInt(FMath::Lerp(this.GetFromExp(), this.GetToExp(), local_16)));
                this.SetExpBarProgress(this.CalculateExpBarProgress(this.GetCurrentExp(), 0, this.GetFromLevelMaxExp()));
            }
            else
            {
                int local_25 = FMath::CeilToInt(FMath::Lerp(0.0, ((this.GetToExp() + this.GetFromLevelMaxExp()) - this.GetFromExp()), local_16));
                if (local_25 <= (this.GetFromLevelMaxExp() - this.GetFromExp()))
                {
                    this.SetCurrentExp(this.GetFromExp() + local_25);
                    this.SetExpBarProgress(this.CalculateExpBarProgress(this.GetCurrentExp(), 0, this.GetFromLevelMaxExp()));
                }
                else
                {
                    this.SetCurrentExp(local_25 - (this.GetFromLevelMaxExp() - this.GetFromExp()));
                    this.SetExpBarProgress(this.CalculateExpBarProgress(this.GetCurrentExp(), 0, this.GetToLevelMaxExp()));
                    if (!(this.GetbLevelChanged()))
                    {
                        local_11 = this.GetLevelUpBannerWidget().IsValid();
                        if (local_11)
                        {
                            this.GetLevelUpBannerWidget().opArrow().PlayAnim_VX_Icon();
                        }
                        this.SetbLevelChanged(true);
                    }
                }
            }
            return;
        }
        if (FFPTime(this.GetCurrentTime()).opCmp((FFPTime(this.GetExpBarStartTime()) + this.GetExpBarDuration())) >= 0)
        {
            bool local_11;
            if (!(this.GetbExpGrowthFinished()))
            {
                this.SetbExpGrowthFinished(true);
                this.SetCurrentExp(this.GetToExp());
                this.SetExpBarProgress(this.CalculateExpBarProgress(this.GetCurrentExp(), 0, this.GetToLevelMaxExp()));
            }
            if (this.GetToLevel() != this.GetFromLevel())
            {
                if (!(this.GetbLevelChanged()))
                {
                    bool local_7 = this.GetLevelUpBannerWidget().IsValid();
                    if (local_7)
                    {
                        this.GetLevelUpBannerWidget().opArrow().PlayAnim_VX_Icon();
                    }
                    this.SetbLevelChanged(true);
                }
                if (!(this.GetbLevelUpAnimPlayed()) && ((FFPTime(this.GetCurrentTime()).opCmp((((FFPTime(this.GetExpBarStartTime()) + this.GetExpBarDuration())) + this.GetPostExpBarDelay())) >= 0)))
                {
                    local_11 = this.GetLevelUpBannerWidget().IsValid();
                    if (local_11)
                    {
                        this.GetLevelUpBannerWidget().opArrow().PlayAnim_In_LevelUp();
                    }
                    this.SetbLevelUpAnimPlayed(true);
                }
            }
        }
        return;
    }
    const FFPTime GetExpBarStartTime() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FFPTime GetModify_ExpBarStartTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetExpBarStartTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ExpBarStartTime = __Value;
        return;
    }
    const FFPTime GetExpBarDuration() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FFPTime GetModify_ExpBarDuration() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetExpBarDuration(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ExpBarDuration = __Value;
        return;
    }
    const FFPTime GetPostExpBarDelay() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FFPTime GetModify_PostExpBarDelay() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetPostExpBarDelay(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_PostExpBarDelay = __Value;
        return;
    }
    const FFPTime GetTimeForAnimOut() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FFPTime GetModify_TimeForAnimOut() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetTimeForAnimOut(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_TimeForAnimOut = __Value;
        return;
    }
    int GetFromLevel() const property
    {
        this.TrackPropertyRead(4);
        return this.m_FromLevel;
    }
    void SetFromLevel(const int __Value) property
    {
        if (this.m_FromLevel == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_FromLevel = __Value;
        return;
    }
    int GetToLevel() const property
    {
        this.TrackPropertyRead(5);
        return this.m_ToLevel;
    }
    void SetToLevel(const int __Value) property
    {
        if (this.m_ToLevel == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_ToLevel = __Value;
        return;
    }
    int GetFromExp() const property
    {
        this.TrackPropertyRead(6);
        return this.m_FromExp;
    }
    void SetFromExp(const int __Value) property
    {
        if (this.m_FromExp == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_FromExp = __Value;
        return;
    }
    int GetToExp() const property
    {
        this.TrackPropertyRead(7);
        return this.m_ToExp;
    }
    void SetToExp(const int __Value) property
    {
        if (this.m_ToExp == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_ToExp = __Value;
        return;
    }
    int GetFromLevelMaxExp() const property
    {
        this.TrackPropertyRead(8);
        return this.m_FromLevelMaxExp;
    }
    void SetFromLevelMaxExp(const int __Value) property
    {
        if (this.m_FromLevelMaxExp == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_FromLevelMaxExp = __Value;
        return;
    }
    int GetToLevelMaxExp() const property
    {
        this.TrackPropertyRead(9);
        return this.m_ToLevelMaxExp;
    }
    void SetToLevelMaxExp(const int __Value) property
    {
        if (this.m_ToLevelMaxExp == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_ToLevelMaxExp = __Value;
        return;
    }
    bool GetbIsOverflow() const property
    {
        this.TrackPropertyRead(10);
        return this.m_bIsOverflow;
    }
    void SetbIsOverflow(const bool __Value) property
    {
        if (!(this.m_bIsOverflow) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_bIsOverflow = __Value;
        return;
    }
    bool GetbIsBreakthroughLevel() const property
    {
        this.TrackPropertyRead(11);
        return this.m_bIsBreakthroughLevel;
    }
    void SetbIsBreakthroughLevel(const bool __Value) property
    {
        if (!(this.m_bIsBreakthroughLevel) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_bIsBreakthroughLevel = __Value;
        return;
    }
    int GetExpGrowth() const property
    {
        this.TrackPropertyRead(12);
        return this.m_ExpGrowth;
    }
    void SetExpGrowth(const int __Value) property
    {
        if (this.m_ExpGrowth == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_ExpGrowth = __Value;
        return;
    }
    TWeakObjectPtr<UWidget_LevelUpBanner> GetLevelUpBannerWidget() const property
    {
        this.TrackPropertyRead(13);
        return this.m_LevelUpBannerWidget;
    }
    void SetLevelUpBannerWidget(const TWeakObjectPtr<UWidget_LevelUpBanner> &inout __Value) property
    {
        if ((this.m_LevelUpBannerWidget == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_LevelUpBannerWidget = __Value;
        return;
    }
    const FFPTime GetCurrentTime() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(14);
        return __r;
    }
    FFPTime GetModify_CurrentTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(14);
        return __r;
    }
    void SetCurrentTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_CurrentTime = __Value;
        return;
    }
    int GetCurrentExp() const property
    {
        this.TrackPropertyRead(15);
        return this.m_CurrentExp;
    }
    void SetCurrentExp(const int __Value) property
    {
        if (this.m_CurrentExp == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_CurrentExp = __Value;
        return;
    }
    const float32 GetExpBarProgress() const property
    {
        const float32 __r;
        this.TrackPropertyRead(16);
        return __r;
    }
    float32 GetModify_ExpBarProgress() property
    {
        float32 __r;
        this.MarkPropertyDirty(16);
        return __r;
    }
    void SetExpBarProgress(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_ExpBarProgress = __Value;
        return;
    }
    bool GetbLevelChanged() const property
    {
        this.TrackPropertyRead(17);
        return this.m_bLevelChanged;
    }
    void SetbLevelChanged(const bool __Value) property
    {
        if (!(this.m_bLevelChanged) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_bLevelChanged = __Value;
        return;
    }
    bool GetbExpGrowthFinished() const property
    {
        this.TrackPropertyRead(18);
        return this.m_bExpGrowthFinished;
    }
    void SetbExpGrowthFinished(const bool __Value) property
    {
        if (!(this.m_bExpGrowthFinished) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(18);
        this.m_bExpGrowthFinished = __Value;
        return;
    }
    bool GetbLevelUpAnimPlayed() const property
    {
        this.TrackPropertyRead(19);
        return this.m_bLevelUpAnimPlayed;
    }
    void SetbLevelUpAnimPlayed(const bool __Value) property
    {
        if (!(this.m_bLevelUpAnimPlayed) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(19);
        this.m_bLevelUpAnimPlayed = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_LevelUpBanner
{
    UPROPERTY()
    FText DisplayExpNum;
    UPROPERTY()
    FText DisplayExpGrowth;
    UPROPERTY()
    FText DisplayAttributeGrowth;
    UPROPERTY()
    bool ShouldDisplayOldLevelNum;
    UPROPERTY()
    bool ReachLevelLimit;
    UPROPERTY()
    FText LevelLimitTips;
    UPROPERTY()
    TEUIModelRef<FVM_LevelUpBanner> Self;


}

namespace FVM_LevelUpBanner
{
FVM_LevelUpBanner& Create(const UObject ContextObject)
{
    return FVM_LevelUpBanner::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_LevelUpBanner CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_LevelUpBanner __r;
    TEUIModelRef<FVM_LevelUpBanner> local_6 = TEUIModelRef<FVM_LevelUpBanner>(EUIInternal::MakeModelWithManager(Manager, FVM_LevelUpBanner::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasPostLoad(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "FromLevel";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ToLevel";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FromExp";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ToExp";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ExpBarProgress";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bLevelChanged";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayExpNum";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayExpGrowth";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayAttributeGrowth";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShouldDisplayOldLevelNum";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ReachLevelLimit";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LevelLimitTips";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_LevelUpBanner>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_LevelUpBanner;
    FEUIModelEffectDefine local_20;
    local_20.FunctionName = "RefreshCurrentExp";
    Result.EffectFunctions.Add(local_20);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_LevelUpBanner;
}
int __UIGetter_FromLevel(const FVM_LevelUpBanner &inout Model)
{
    return Model.GetFromLevel();
}
int __UIGetter_ToLevel(const FVM_LevelUpBanner &inout Model)
{
    return Model.GetToLevel();
}
int __UIGetter_FromExp(const FVM_LevelUpBanner &inout Model)
{
    return Model.GetFromExp();
}
int __UIGetter_ToExp(const FVM_LevelUpBanner &inout Model)
{
    return Model.GetToExp();
}
float32 __UIGetter_ExpBarProgress(const FVM_LevelUpBanner &inout Model)
{
    return Model.GetExpBarProgress();
}
bool __UIGetter_bLevelChanged(const FVM_LevelUpBanner &inout Model)
{
    return Model.GetbLevelChanged();
}
FText __UIGetter_DisplayExpNum(const FVM_LevelUpBanner &inout Model)
{
    return Model.GetDisplayExpNum();
}
FText __UIGetter_DisplayExpGrowth(const FVM_LevelUpBanner &inout Model)
{
    return Model.GetDisplayExpGrowth();
}
FText __UIGetter_DisplayAttributeGrowth(const FVM_LevelUpBanner &inout Model)
{
    return Model.GetDisplayAttributeGrowth();
}
bool __UIGetter_ShouldDisplayOldLevelNum(const FVM_LevelUpBanner &inout Model)
{
    return Model.GetShouldDisplayOldLevelNum();
}
bool __UIGetter_ReachLevelLimit(const FVM_LevelUpBanner &inout Model)
{
    return Model.GetReachLevelLimit();
}
FText __UIGetter_LevelLimitTips(const FVM_LevelUpBanner &inout Model)
{
    return Model.GetLevelLimitTips();
}
TEUIModelRef<FVM_LevelUpBanner> __UIGetter_Self(const FVM_LevelUpBanner &inout Model)
{
    return TEUIModelRef<FVM_LevelUpBanner>(Model);
}
int __IndexOf_ExpBarStartTime()
{
    return 0;
}
int __IndexOf_ExpBarDuration()
{
    return 1;
}
int __IndexOf_PostExpBarDelay()
{
    return 2;
}
int __IndexOf_TimeForAnimOut()
{
    return 3;
}
int __IndexOf_FromLevel()
{
    return 4;
}
int __IndexOf_ToLevel()
{
    return 5;
}
int __IndexOf_FromExp()
{
    return 6;
}
int __IndexOf_ToExp()
{
    return 7;
}
int __IndexOf_FromLevelMaxExp()
{
    return 8;
}
int __IndexOf_ToLevelMaxExp()
{
    return 9;
}
int __IndexOf_bIsOverflow()
{
    return 10;
}
int __IndexOf_bIsBreakthroughLevel()
{
    return 11;
}
int __IndexOf_ExpGrowth()
{
    return 12;
}
int __IndexOf_LevelUpBannerWidget()
{
    return 13;
}
int __IndexOf_CurrentTime()
{
    return 14;
}
int __IndexOf_CurrentExp()
{
    return 15;
}
int __IndexOf_ExpBarProgress()
{
    return 16;
}
int __IndexOf_bLevelChanged()
{
    return 17;
}
int __IndexOf_bExpGrowthFinished()
{
    return 18;
}
int __IndexOf_bLevelUpAnimPlayed()
{
    return 19;
}
}
namespace __GeneratedProperties_FVM_LevelUpBanner
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
