
namespace FVM_TutorialHud
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnClose = FEUIModelCallbackSignature();

}
struct FVM_TutorialHud : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_TutorialHudItem>> m_Items;
    UPROPERTY()
    float32 m_Countdown;
    UPROPERTY()
    bool m_bUseCountdown;
    UPROPERTY()
    TDataObjectPtr<FTutorialInfoConfig> m_CurrentInfoConfig;
    UPROPERTY()
    bool m_bCountdownFinished;

    FVM_TutorialHud()
    {
        this.m_Countdown = 0.0f;
        this.m_bUseCountdown = false;
        this.m_bCountdownFinished = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_TutorialHud(const FVM_TutorialHud &inout Other)
    {
        this.m_Countdown = 0.0f;
        this.m_bUseCountdown = false;
        this.m_bCountdownFinished = false;
        this.m_Items = Other.m_Items;
        this.m_Countdown = Other.m_Countdown;
        this.m_bUseCountdown = Other.m_bUseCountdown;
        this.m_CurrentInfoConfig = Other.m_CurrentInfoConfig;
        this.m_bCountdownFinished = Other.m_bCountdownFinished;
        return;
    }
    FVM_TutorialHud opAssign(const FVM_TutorialHud &inout Other)
    {
        FVM_TutorialHud __r;
        this.m_Items = Other.m_Items;
        this.m_Countdown = Other.m_Countdown;
        this.m_bUseCountdown = Other.m_bUseCountdown;
        this.m_CurrentInfoConfig = Other.m_CurrentInfoConfig;
        this.m_bCountdownFinished = Other.m_bCountdownFinished;
        return __r;
    }
    void Tick()
    {
        if (!(this.GetbUseCountdown()) || this.GetbCountdownFinished())
        {
            return;
        }
        if (::FMS_ClientCondition::Get(this.GetManager()).IsLoading())
        {
            return;
        }
        float32 local_9 = ECS::GetUEWorld().GetDeltaSeconds();
        this.SetCountdown((this.GetCountdown() - local_9));
        if (this.GetCountdown() <= 0.0f)
        {
            this.SetbCountdownFinished(true);
            this.OnClose();
        }
        return;
    }
    void InitFromInfo(const FTutorialInfo &inout Info)
    {
        this.SetCurrentInfoConfig(Info.GetTutorialInfoId());
        this.SetCountdown(Info.GetCountdown());
        this.SetbUseCountdown((Info.GetCountdown() > 0.0f));
        this.SetbCountdownFinished(false);
        this.RebuildItems(Info);
        return;
    }
    void UpdateFromInfo(const FTutorialInfo &inout Info)
    {
        const FTutorialInfoConfig& local_2;
        FVM_TutorialHudItem& local_8;
        int local_10;
        int local_3 = 0;
        for (; local_3 < this.GetItems().Num(); ++local_3)
        {
            if (local_8.GetStepIndex() < 0)
            {
                continue;
            }
            local_10 = local_8.GetStepIndex();
            if (local_10 < Info.GetStepProgress().Num() && (local_10 < local_2.Steps.Num()))
            {
                const FTutorialStepProgress& local_14 = Info.GetStepProgress()[local_10];
                if (local_14.GetMaxProgress() <= 0)
                {
                    local_8.SetbIsProgress(false);
                    local_8.SetbFinished(false);
                    local_8.SetDisplayText(local_2.Steps[local_10].DescKey);
                    continue;
                }
                local_8.SetbIsProgress(true);
                local_8.SetbFinished((local_14.GetCurrentProgress() >= local_14.GetMaxProgress()));
                local_8.SetDisplayText(this.FormatStepText(local_2.Steps[local_10].DescKey, local_14));
            }
        }
        return;
    }
    bool IsAllProgressFinished() const
    {
        for (auto& local_16 : this.GetItems())
        {
            local_16;
            if (GetbIsProgress() && !(GetbFinished()))
            {
                return false;
            }
        }
        return true;
    }
    void OnClose()
    {
        ::FMS_GuideManual::Get(this.GetManager()).CloseTutorialHud();
        return;
    }
    void RebuildItems(const FTutorialInfo &inout Info)
    {
        const FTutorialInfoConfig& local_4;
        FVM_TutorialHudItem& local_16;
        this.GetModify_Items().Empty(0);
        int local_5 = 0;
        int local_6 = 0;
        for (; local_6 < local_4.Steps.Num(); )
        {
            TEUIModelRef<FVM_TutorialHudItem> TEUIModelRef<FVM_TutorialHudItem>() = TEUIModelRef<FVM_TutorialHudItem>(::FVM_TutorialHudItem::Create(this.GetManager(), local_5));
            local_16.SetStepIndex(local_6);
            if (local_6 < Info.GetStepProgress().Num())
            {
                const FTutorialStepProgress& local_18 = Info.GetStepProgress()[local_6];
                if (local_18.GetMaxProgress() <= 0)
                {
                    local_16.SetbIsProgress(false);
                    local_16.SetbFinished(false);
                    local_16.SetDisplayText(local_4.Steps[local_6].DescKey);
                }
                else
                {
                    local_16.SetbIsProgress(true);
                    local_16.SetbFinished((local_18.GetCurrentProgress() >= local_18.GetMaxProgress()));
                    local_16.SetDisplayText(this.FormatStepText(local_4.Steps[local_6].DescKey, local_18));
                }
            }
            else
            {
                local_16.SetbIsProgress(true);
                local_16.SetbFinished(false);
                local_16.SetDisplayText(local_4.Steps[local_6].DescKey);
            }
            this.GetModify_Items().Add(TEUIModelRef<FVM_TutorialHudItem>());
            local_5 = local_5 + 1;
            ++local_6;
        }
        if (!(local_4.ExtraDescKey.IsEmpty()))
        {
            TEUIModelRef<FVM_TutorialHudItem> local_14 = TEUIModelRef<FVM_TutorialHudItem>(::FVM_TutorialHudItem::Create(this.GetManager(), local_5));
            local_16.SetbIsProgress(false);
            local_16.SetbFinished(false);
            local_16.SetStepIndex(-1);
            local_16.SetDisplayText(local_4.ExtraDescKey);
            this.GetModify_Items().Add(local_14);
        }
        return;
    }
    FText FormatStepText(const FText &inout DescKey, const FTutorialStepProgress &inout Progress) const
    {
        return FText::Format(FText::AsCultureInvariant("{0}  <Yellow22F>{1}/{2}</>"), DescKey, Progress.GetCurrentProgress(), Progress.GetMaxProgress());
    }
    const TArray<TEUIModelRef<FVM_TutorialHudItem>> GetItems() const property
    {
        const TArray<TEUIModelRef<FVM_TutorialHudItem>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<TEUIModelRef<FVM_TutorialHudItem>> GetModify_Items() property
    {
        TArray<TEUIModelRef<FVM_TutorialHudItem>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetItems(const TArray<TEUIModelRef<FVM_TutorialHudItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Items = __Value;
        return;
    }
    float32 GetCountdown() const property
    {
        float32 __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    float32 GetModify_Countdown() property
    {
        float32 __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetCountdown(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Countdown = __Value;
        return;
    }
    bool GetbUseCountdown() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bUseCountdown;
    }
    void SetbUseCountdown(const bool __Value) property
    {
        if (!(this.m_bUseCountdown) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bUseCountdown = __Value;
        return;
    }
    const TDataObjectPtr<FTutorialInfoConfig> GetCurrentInfoConfig() const property
    {
        const TDataObjectPtr<FTutorialInfoConfig> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TDataObjectPtr<FTutorialInfoConfig> GetModify_CurrentInfoConfig() property
    {
        TDataObjectPtr<FTutorialInfoConfig> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetCurrentInfoConfig(const TDataObjectPtr<FTutorialInfoConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CurrentInfoConfig = __Value;
        return;
    }
    bool GetbCountdownFinished() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bCountdownFinished;
    }
    void SetbCountdownFinished(const bool __Value) property
    {
        if (!(this.m_bCountdownFinished) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bCountdownFinished = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TutorialHud
{
    UPROPERTY()
    bool IsAllProgressFinished;
    UPROPERTY()
    TEUIModelRef<FVM_TutorialHud> Self;


}

namespace FVM_TutorialHud
{
FVM_TutorialHud& Create(const UObject ContextObject)
{
    return FVM_TutorialHud::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_TutorialHud CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_TutorialHud __r;
    TEUIModelRef<FVM_TutorialHud> local_6 = TEUIModelRef<FVM_TutorialHud>(EUIInternal::MakeModelWithManager(Manager, FVM_TutorialHud::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Items";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_TutorialHudItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Countdown";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bUseCountdown";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsAllProgressFinished";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TutorialHud>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TutorialHud;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TutorialHud;
}
void __Tick(FVM_TutorialHud &inout Model)
{
    Model.Tick();
    return;
}
TArray<TEUIModelRef<FVM_TutorialHudItem>> __UIGetter_Items(const FVM_TutorialHud &inout Model)
{
    return Model.GetItems();
}
float32 __UIGetter_Countdown(const FVM_TutorialHud &inout Model)
{
    return Model.GetCountdown();
}
bool __UIGetter_bUseCountdown(const FVM_TutorialHud &inout Model)
{
    return Model.GetbUseCountdown();
}
bool __UIGetter_IsAllProgressFinished(const FVM_TutorialHud &inout Model)
{
    return Model.IsAllProgressFinished();
}
TEUIModelRef<FVM_TutorialHud> __UIGetter_Self(const FVM_TutorialHud &inout Model)
{
    return TEUIModelRef<FVM_TutorialHud>(Model);
}
int __IndexOf_Items()
{
    return 0;
}
int __IndexOf_Countdown()
{
    return 1;
}
int __IndexOf_bUseCountdown()
{
    return 2;
}
int __IndexOf_CurrentInfoConfig()
{
    return 3;
}
int __IndexOf_bCountdownFinished()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_TutorialHud
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
