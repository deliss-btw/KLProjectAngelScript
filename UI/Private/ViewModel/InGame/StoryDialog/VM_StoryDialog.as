
namespace FVMS_StoryDialog
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature NextSection = FEUIModelCallbackSignature();

}
struct FVMS_StoryDialog : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    FStoryDialogInfo m_DialogInfo;
    UPROPERTY()
    int m_CurrentSectionIndex;
    UPROPERTY()
    FText m_CurrentSpeaker;
    UPROPERTY()
    FText m_CurrentContent;
    UPROPERTY()
    TArray<FEUIModelRef> m_CurrentOptions;

    FVMS_StoryDialog()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVMS_StoryDialog(const FVMS_StoryDialog &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVMS_StoryDialog& opAssign(const FVMS_StoryDialog &inout Other)
    {
        this.m_CurrentSectionIndex = int(Other.m_CurrentSectionIndex);
        this.m_CurrentSpeaker = Other.m_CurrentSpeaker;
        this.m_CurrentContent = Other.m_CurrentContent;
        return Other.m_CurrentOptions;
    }
    void InitiateDialog(const FStoryDialogInfo &inout InInfo)
    {
        this.SetDialogInfo(InInfo);
        this.SetCurrentSectionIndex(0);
        if (InInfo.GetDialogSections().Num() == 2 && InInfo.GetDialogSections()[0].GetOptions().IsEmpty() && InInfo.GetDialogSections()[1].GetbIsPureOption())
        {
            this.SetCurrentSectionIndex(1);
        }
        return;
    }
    void OnCurrentContentChanged()
    {
        this.RefreshCurrentSection();
        return;
    }
    void NextSection()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    bool HasNextSection() const
    {
        return !(this.IsAtEnd()) || !(this.IsEndWithOption());
    }
    void RefreshCurrentSection()
    {
        if (!(this.GetDialogInfo().GetDialogSections().IsValidIndex(this.GetCurrentSectionIndex())))
        {
            FText local_6;
            this.SetCurrentContent(local_6);
            this.GetModify_CurrentOptions().Empty(0);
            return;
        }
        const FStoryDialogSection& local_10 = this.GetDialogInfo().GetDialogSections()[this.FindSpeakerSectionIndex(this.GetCurrentSectionIndex())];
        const FStoryDialogSection& local_12 = this.GetDialogInfo().GetDialogSections()[this.GetCurrentSectionIndex()];
        TArray<FString> local_16;
        for (auto& local_30 : local_10.GetParticipantDetails())
        {
            local_16.Add(this.GetParticipantName(local_30));
        }
        this.SetCurrentSpeaker(FText::FromString(FString::Join(local_16, "гЂЃ")));
        this.SetCurrentContent(FText::FromString(local_10.GetContent().GetStringData()));
        this.GetModify_CurrentOptions().Empty(0);
        int local_35 = 0;
        for (; local_35 < local_12.GetOptions().Num(); )
        {
            const FStoryDialogDisplayData& local_38 = local_12.GetOptions()[local_35];
            FVM_StoryDialogOption& local_40 = ::FVM_StoryDialogOption::Create(this.GetContext().Manager);
            local_40.SetOptionIndex(local_35);
            local_40.SetOptionContent(FText::FromString(local_38.GetStringData()));
            this.GetModify_CurrentOptions().Add(FEUIModelRef(local_40));
            ++local_35;
        }
        return;
    }
    FString GetParticipantName(const FStoryDialogParticipantDetail &inout ParticipantDetail) const
    {
        if (!(ParticipantDetail.GetNickName().IsEmpty()))
        {
            return ParticipantDetail.GetNickName();
        }
        if (this.GetDialogInfo().GetParticipants().IsValidIndex(ParticipantDetail.GetParticipantIndex()))
        {
            const FECSEntity& local_8 = this.GetDialogInfo().GetParticipants()[ParticipantDetail.GetParticipantIndex()];
            Get local_12;
            if (local_12.opCall())
            {
                Get local_18;
                const FC_DSPlayerInfo& local_20 = local_18.opCall();
                if (local_20)
                {
                    return local_20.GetNickName();
                }
            }
            else
            {
                FString local_4 = ::FASCommonUtils::GetEntityShowName(local_8);
                if (!(local_4.IsEmpty()))
                {
                    return local_4;
                }
            }
            Get local_28;
            const FC_Name& local_30 = local_28.opCall();
            if (local_30)
            {
                return local_30.Name.ToString();
            }
        }
        return "???";
    }
    bool IsAtEnd() const
    {
        return ((this.GetCurrentSectionIndex() + 1) >= this.GetDialogInfo().GetDialogSections().Num());
    }
    bool IsEndWithOption() const
    {
        return !(this.GetDialogInfo().GetDialogSections().Last(0).GetOptions().IsEmpty());
    }
    int FindSpeakerSectionIndex(const int CurrentoptionSectionIndex) const
    {
        int local_1 = CurrentoptionSectionIndex;
        for (; local_1 >= 0; --local_1)
        {
            if (!(this.GetDialogInfo().GetDialogSections()[local_1].GetbIsPureOption()))
            {
                return local_1;
            }
        }
        return CurrentoptionSectionIndex;
    }
    const FStoryDialogInfo GetDialogInfo() const property
    {
        const FStoryDialogInfo __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FStoryDialogInfo GetModify_DialogInfo() property
    {
        FStoryDialogInfo __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetDialogInfo(const FStoryDialogInfo &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        return;
    }
    int GetCurrentSectionIndex() const property
    {
        this.TrackPropertyRead(1);
        return this.m_CurrentSectionIndex;
    }
    void SetCurrentSectionIndex(const int __Value) property
    {
        if (this.m_CurrentSectionIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CurrentSectionIndex = __Value;
        return;
    }
    const FText GetCurrentSpeaker() const property
    {
        const FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_CurrentSpeaker() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetCurrentSpeaker(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CurrentSpeaker = __Value;
        return;
    }
    const FText GetCurrentContent() const property
    {
        const FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_CurrentContent() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetCurrentContent(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CurrentContent = __Value;
        return;
    }
    const TArray<FEUIModelRef> GetCurrentOptions() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_CurrentOptions() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetCurrentOptions(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_CurrentOptions = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_StoryDialog
{
    UPROPERTY()
    bool HasNextSection;
    UPROPERTY()
    TEUIModelRef<FVMS_StoryDialog> Self;


}

namespace FVMS_StoryDialog
{
FVMS_StoryDialog& Get(const UObject ContextObject)
{
    return FVMS_StoryDialog::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_StoryDialog GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_StoryDialog __r;
    TEUIModelRef<FVMS_StoryDialog> local_6 = TEUIModelRef<FVMS_StoryDialog>(EUIInternal::MakeModelWithManager(Manager, FVMS_StoryDialog::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "CurrentSpeaker";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentContent";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentOptions";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasNextSection";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_StoryDialog>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_StoryDialog;
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__OnCurrentContentChanged";
    local_24.DirtyFlags.Set(FVMS_StoryDialog::__IndexOf_CurrentSectionIndex());
    Result.DirtyFunctions.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_StoryDialog;
}
void __OnCurrentContentChanged(FVMS_StoryDialog &inout Model)
{
    Model.OnCurrentContentChanged();
    return;
}
FText __UIGetter_CurrentSpeaker(const FVMS_StoryDialog &inout Model)
{
    return Model.GetCurrentSpeaker();
}
FText __UIGetter_CurrentContent(const FVMS_StoryDialog &inout Model)
{
    return Model.GetCurrentContent();
}
TArray<FEUIModelRef> __UIGetter_CurrentOptions(const FVMS_StoryDialog &inout Model)
{
    return Model.GetCurrentOptions();
}
bool __UIGetter_HasNextSection(const FVMS_StoryDialog &inout Model)
{
    return Model.HasNextSection();
}
TEUIModelRef<FVMS_StoryDialog> __UIGetter_Self(const FVMS_StoryDialog &inout Model)
{
    return TEUIModelRef<FVMS_StoryDialog>(Model);
}
int __IndexOf_DialogInfo()
{
    return 0;
}
int __IndexOf_CurrentSectionIndex()
{
    return 1;
}
int __IndexOf_CurrentSpeaker()
{
    return 2;
}
int __IndexOf_CurrentContent()
{
    return 3;
}
int __IndexOf_CurrentOptions()
{
    return 4;
}
}
namespace __GeneratedProperties_FVMS_StoryDialog
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
