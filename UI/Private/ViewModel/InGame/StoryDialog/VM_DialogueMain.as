namespace FVMS_DialogueMain
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature NextSection = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature HandleEscape = FEUIModelCallbackSignature();

struct FDialogueTextArgSpan
{
    UPROPERTY()
    int Start;
    UPROPERTY()
    int Length;
    UPROPERTY()
    FString Value;

    FDialogueTextArgSpan(const int InStart, const int InLength, const FString &inout InValue)
    {
        this.Start = InStart;
        this.Length = InLength;
        this.Value = InValue;
        return;
    }
}

}
struct FVMS_DialogueMain : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    FText m_Speaker;
    UPROPERTY()
    FText m_Content;
    UPROPERTY()
    TEUIModelRef<FVM_DialogueOptionList> m_OptionList;
    UPROPERTY()
    FFPTime m_LastClickTime;
    UPROPERTY()
    FECSEntity m_LastDialogueEntity;
    UPROPERTY()
    TMap<FString, FString> m_EvaluatedCache;

    default m_ScriptOverrideMeta = Cast<UASStruct>(FVMS_DialogueMain.Get());

    FVMS_DialogueMain()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
        }
        else
        {
        }
        this.__InitDefaults();
        return;
    }
    FVMS_DialogueMain(const FVMS_DialogueMain &inout Other)
    {
        this.m_Speaker = Other.m_Speaker;
        this.m_Content = Other.m_Content;
        this.m_OptionList = Other.m_OptionList;
        this.m_LastClickTime = Other.m_LastClickTime;
        this.m_LastDialogueEntity = Other.m_LastDialogueEntity;
        this.m_EvaluatedCache = Other.m_EvaluatedCache;
        this.__InitDefaults();
        return;
    }
    FVMS_DialogueMain& opAssign(const FVMS_DialogueMain &inout Other)
    {
        this.m_Speaker = Other.m_Speaker;
        this.m_Content = Other.m_Content;
        this.m_OptionList = Other.m_OptionList;
        this.m_LastClickTime = Other.m_LastClickTime;
        this.m_LastDialogueEntity = Other.m_LastDialogueEntity;
        return Other.m_EvaluatedCache;
    }
    void PostConstruct()
    {
        this.SetOptionList(TEUIModelRef<FVM_DialogueOptionList>(::FVM_DialogueOptionList::Create(this.GetContext().Manager)));
        return;
    }
    void OnOwnerWidgetBind_Implementation()
    {
        return;
    }
    void OnOwnerWidgetUnbind_Implementation()
    {
        this.GetModify_EvaluatedCache().Empty(0);
        return;
    }
    FText ResolveDialogueArgText(const FText &inout InText)
    {
        const UDialogueSettings local_2;
        GetGameplaySettings<UDialogueSettings> local_4;
        local_2 = local_4;
        if (!((local_2 != nullptr)) || local_2.DialogueArgTextMap.IsEmpty())
        {
            return InText;
        }
        FString local_16 = InText.ToString();
        TArray<FVMS_DialogueMain::FDialogueTextArgSpan> local_20;
        int local_21 = 0;
        while (true)
        {
            int local_22 = local_16.Find("{", ESearchCase(1), ESearchDir(0), local_21);
            if (local_22 == INDEX_NONE)
            {
                break;
            }
            int local_27 = local_16.Find("}", ESearchCase(1), ESearchDir(0), local_22 + 1);
            if (local_27 == INDEX_NONE)
            {
                break;
            }
            FString local_32;
            FString local_36;
            int local_23 = local_16.Find("#", ESearchCase(1), ESearchDir(0), local_22 + 1);
            if (local_23 != INDEX_NONE && (local_23 < local_27))
            {
                local_32 = local_16.Mid(local_22 + 1, local_23 - local_22);
                local_36 = local_16.Mid(local_23 + 1, ((local_27 - local_23) - 1));
            }
            else
            {
                local_32 = local_16.Mid(local_22 + 1, ((local_27 - local_22) - 1));
            }
            local_21 = local_27 + 1;
            FString local_42;
            if (!(this.GetEvaluatedCache().Find(local_32, local_42)))
            {
                FDialogueArgTextConfig local_52;
                if (!(local_2.DialogueArgTextMap.Find(local_32, local_52)))
                {
                    continue;
                }
                local_42 = this.EvaluateDialogueArgConfig(local_52, local_36).ToString();
                if (local_52.bNeedCache)
                {
                    this.GetModify_EvaluatedCache().Add(local_32, local_42);
                }
            }
            local_20.Add(FVMS_DialogueMain::FDialogueTextArgSpan(local_22, ((local_27 - local_22) + 1), local_42));
        }
        if (local_20.IsEmpty())
        {
            return InText;
        }
        int local_63 = local_20.Num() - 1;
        for (; local_63 >= 0; )
        {
            FDialogueTextArgSpan& local_66 = local_20[local_63];
            int local_22_2 = int(local_66.Start);
            FString local_70 = (local_16.Left(local_22_2) + local_66.Value);
            local_22_2 = int(local_66.Start);
            local_22_2 = local_22_2 + int(local_66.Length);
            local_16 = (local_70 + local_16.Mid(local_22_2, 2147483647));
            --local_63;
        }
        return FText::FromString(local_16);
    }
    FText EvaluateDialogueArgConfig(const FDialogueArgTextConfig &inout ArgConfig, const FString &inout InText)
    {
        EGenderType local_1 = ::FASCommonUtils::GetLocalPlayerGender();
        if ((int(ArgConfig.PlayerGender) == 1 && (int(local_1) != 0)))
        {
            return FText();
        }
        else
        {
            if ((int(ArgConfig.PlayerGender) == 2 && (int(local_1) != 1)))
            {
                return FText();
            }
            else
            {
                if (ArgConfig.bEnableArgText)
                {
                    TArray<FTextArgument> local_16;
                    FECSEntity local_26 = this.GetContext().GetLocalPlayer();
                    Make local_22;
                    local_16.Add(local_22.opImplConv());
                    return ArgText::FormatArgText_SpecifiedWorldContext(ECS::GetUEWorld(), ArgConfig.ArgText, local_16);
                }
                else
                {
                    return FText::FromString(InText);
                }
            }
        }
    }
    void SetSubtitle(const FDialogueSubtitle &inout Subtitle)
    {
        this.SetSpeaker(Subtitle.GetSpeakerName());
        this.SetContent(this.ResolveDialogueArgText(Subtitle.GetContent()));
        this.SetLastDialogueEntity(Subtitle.GetEntity());
        return;
    }
    void SetOptions(const TArray<FDialogueOptionInfo> &inout Options)
    {
        this.GetOptionList().Get().GetModify_OptionItems().Empty(0);
        int local_4 = 0;
        for (; local_4 < Options.Num(); )
        {
            FDialogueOptionInfo local_70 = FDialogueOptionInfo(Options[local_4]);
            local_70.SetOptionText(this.ResolveDialogueArgText(local_70.GetOptionText()));
            this.GetOptionList().Get().GetModify_OptionItems().Add(TEUIModelRef<FVM_DialogueOptionItem>(::FVM_DialogueOptionItem::Create(this.GetContext().Manager, local_70)));
            ++local_4;
        }
        return;
    }
    void OnDialogueUpdateSubtitleUI(const FCE_DialogueUpdateUI &inout Event)
    {
        if (Event.bUpdateSubtitle)
        {
            this.SetSubtitle(Event.Subtitle);
        }
        if (Event.bUpdateOptions)
        {
            this.SetOptions(Event.Options);
        }
        return;
    }
    void NextSection()
    {
        const UDialogueSettings local_6;
        if (this.GetOptionList().Get().HasOptionItems())
        {
            return;
        }
        GetGameplaySettings<UDialogueSettings> local_8;
        local_6 = local_8;
        FFPTime local_14 = (FFPTime(ECS::GetRuntimeInfo().Time) - this.GetLastClickTime());
        if (local_14.opCmp(local_6.DialogueClickInterval) < 0)
        {
            return;
        }
        this.SetLastClickTime(ECS::GetRuntimeInfo().Time);
        FECSEntity local_24 = this.GetContext().GetLocalPlayer();
        FC_DialogueNextSubtitleTag local_30;
        Assign local_28;
        local_28.opCall(local_30);
        return;
    }
    void HandleEscape()
    {
        if (!(this.GetOptionList().Get().HasOptionItems()))
        {
            return;
        }
        for (auto& local_18 : this.GetOptionList().Get().GetOptionItems())
        {
            if (!(local_18.Get().GetOptionInfo().GetOptionStyle().IsSet()))
            {
                continue;
            }
            if (local_18.Get().GetOptionInfo().GetOptionStyle().Get().bIsEscapeOption)
            {
                local_18.Get().SelectOption();
                break;
            }
        }
        return;
    }
    const FText GetSpeaker() const property
    {
        const FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_Speaker() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetSpeaker(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Speaker = __Value;
        return;
    }
    FText GetContent() const property
    {
        FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_Content() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetContent(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Content = __Value;
        return;
    }
    TEUIModelRef<FVM_DialogueOptionList> GetOptionList() const property
    {
        this.TrackPropertyRead(2);
        return this.m_OptionList;
    }
    void SetOptionList(const TEUIModelRef<FVM_DialogueOptionList> &inout __Value) property
    {
        TEUIModelRef<FVM_DialogueOptionList> local_2;
        local_2 = this.m_OptionList;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_OptionList = __Value;
        return;
    }
    const FFPTime GetLastClickTime() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FFPTime GetModify_LastClickTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetLastClickTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_LastClickTime = __Value;
        return;
    }
    const FECSEntity GetLastDialogueEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FECSEntity GetModify_LastDialogueEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetLastDialogueEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_LastDialogueEntity = __Value;
        return;
    }
    const TMap<FString, FString> GetEvaluatedCache() const property
    {
        const TMap<FString, FString> __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    TMap<FString, FString> GetModify_EvaluatedCache() property
    {
        TMap<FString, FString> __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetEvaluatedCache(const TMap<FString, FString> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_EvaluatedCache = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_DialogueMain
{
    UPROPERTY()
    TEUIModelRef<FVMS_DialogueMain> Self;

    __GeneratedProperties_FVMS_DialogueMain()
    {
        return;
    }
}

namespace FVMS_DialogueMain
{
FVMS_DialogueMain& Get(const UObject ContextObject)
{
    return FVMS_DialogueMain::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_DialogueMain& GetByManager(const UEUIManagerSubsystem Manager)
{
    return TEUIModelRef<FVMS_DialogueMain>(EUIInternal::MakeModelWithManager(Manager, FVMS_DialogueMain::ModelId)).Get();
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Speaker";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Content";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "OptionList";
    local_14.TypeName = "TEUIModelRef<FVM_DialogueOptionList>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_DialogueMain>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_DialogueMain;
    FEUIModelEventDefine local_22;
    local_22.FunctionName = "__OnDialogueUpdateSubtitleUI";
    local_22.EventType = FCE_DialogueUpdateUI;
    Result.EventFunctions.Add(local_22);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_DialogueMain;
}
void __OnDialogueUpdateSubtitleUI(FVMS_DialogueMain &inout Model, const FCE_DialogueUpdateUI &inout Event)
{
    Model.OnDialogueUpdateSubtitleUI(Event);
    return;
}
FText __UIGetter_Speaker(const FVMS_DialogueMain &inout Model)
{
    return Model.GetSpeaker();
}
FText __UIGetter_Content(const FVMS_DialogueMain &inout Model)
{
    return Model.GetContent();
}
TEUIModelRef<FVM_DialogueOptionList> __UIGetter_OptionList(const FVMS_DialogueMain &inout Model)
{
    return Model.GetOptionList();
}
TEUIModelRef<FVMS_DialogueMain> __UIGetter_Self(const FVMS_DialogueMain &inout Model)
{
    return TEUIModelRef<FVMS_DialogueMain>(Model);
}
int __IndexOf_Speaker()
{
    return 0;
}
int __IndexOf_Content()
{
    return 1;
}
int __IndexOf_OptionList()
{
    return 2;
}
int __IndexOf_LastClickTime()
{
    return 3;
}
int __IndexOf_LastDialogueEntity()
{
    return 4;
}
int __IndexOf_EvaluatedCache()
{
    return 5;
}
}
namespace __GeneratedProperties_FVMS_DialogueMain
{
UScriptStruct StaticStruct()
{
    return __GeneratedProperties_FVMS_DialogueMain.Get();
}
}
