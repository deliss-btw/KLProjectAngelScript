
namespace FVMS_DialogueMain
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature NextSection = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature HandleEscape = FEUIModelCallbackSignature();

// NOTE: class defaults are not authored in this module: FVMS_DialogueMain (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

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
        // body not fully recovered вЂ” stub [opcode-uncovered]
        FText __r; return __r;
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
        TEUIModelRef<FVM_DialogueOptionList> local_2 = this.GetOptionList();
        GetModify_OptionItems().Empty(0);
        int local_4 = 0;
        for (; local_4 < Options.Num(); )
        {
            FDialogueOptionInfo local_70 = FDialogueOptionInfo(Options[local_4]);
            local_70.SetOptionText(this.ResolveDialogueArgText(local_70.GetOptionText()));
            TEUIModelRef<FVM_DialogueOptionItem> local_82 = TEUIModelRef<FVM_DialogueOptionItem>(::FVM_DialogueOptionItem::Create(this.GetContext().Manager, local_70));
            TEUIModelRef<FVM_DialogueOptionList> local_2_2 = this.GetOptionList();
            GetModify_OptionItems().Add(local_82);
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
        TEUIModelRef<FVM_DialogueOptionList> local_2 = this.GetOptionList();
        if (HasOptionItems())
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
        TEUIModelRef<FVM_DialogueOptionList> local_2 = this.GetOptionList();
        if (!(HasOptionItems()))
        {
            return;
        }
        TEUIModelRef<FVM_DialogueOptionList> local_2_2 = this.GetOptionList();
        for (auto& local_18 : GetOptionItems())
        {
            local_18;
            bool local_3 = !(GetOptionInfo().GetOptionStyle().IsSet());
            if (local_3)
            {
                continue;
            }
            if (local_3)
            {
                SelectOption();
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
FVMS_DialogueMain GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_DialogueMain __r;
    TEUIModelRef<FVMS_DialogueMain> local_6 = TEUIModelRef<FVMS_DialogueMain>(EUIInternal::MakeModelWithManager(Manager, FVMS_DialogueMain::ModelId));
    return __r;
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
    UScriptStruct local_2;
    return local_2;
}
}
